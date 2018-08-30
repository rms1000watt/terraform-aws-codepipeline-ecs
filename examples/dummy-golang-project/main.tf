provider "aws" {
  region = "us-west-2"
}

variable "github_oauth_token" {}

module "codepipeline_ecs" {
  source = "../.."

  github_org         = "rms1000watt"
  github_repo        = "dummy-golang-project"
  github_oauth_token = "${var.github_oauth_token}"

  ecs_cluster         = "${module.ecs.ecs_name_cluster}"
  ecs_service         = "${module.ecs.ecs_name_service}"
  ecs_task_definition = "${module.ecs.ecs_name_task_definition}"
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "1.40.0"

  name               = "dev"
  cidr               = "10.0.0.0/16"
  enable_nat_gateway = false

  azs            = ["us-west-2a", "us-west-2b", "us-west-2c"]
  public_subnets = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  tags {
    Environment = "dev"
  }
}

module "sg" {
  source  = "rms1000watt/easy-sg/aws"
  version = "0.1.0"

  vpc_id = "${module.vpc.vpc_id}"
}

module "ecs" {
  source  = "rms1000watt/ecs-fargate/aws"
  version = "0.1.25"

  security_groups = ["${module.sg.id}"]
  subnets         = ["${module.vpc.public_subnets}"]
  vpc_id          = "${module.vpc.vpc_id}"
  container_port  = "9999"

  env_keys = ["MYSQL_USER", "MYSQL_PASS"]
  env_vals = ["user", "pass"]
}
