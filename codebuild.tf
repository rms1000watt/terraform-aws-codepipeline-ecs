module "codebuild" {
  source  = "rms1000watt/codebuild/aws"
  version = "0.1.13"

  project_name        = "${local.project_name}"
  project_description = "${var.project_description}"
  build_spec          = "${var.build_spec}"
  build_timeout       = "${var.build_timeout}"
  tags                = "${var.tags}"
  artifacts_type      = "${var.artifacts_type}"

  builder_size     = "${var.builder_size}"
  builder_image    = "${var.builder_image}"
  builder_role_arn = "${local.builder_role_arn}"

  github_repo        = "${local.codebuild_github_repo}"
  github_clone_depth = "${var.github_clone_depth}"

  env_keys = ["${var.env_keys}"]
  env_vals = ["${var.env_vals}"]

  vpc_id          = "${var.vpc_id}"
  subnets         = ["${var.subnets}"]
  security_groups = ["${var.security_groups}"]
}

module "codebuild_integration_test" {
  source  = "rms1000watt/codebuild/aws"
  version = "0.1.13"

  project_name        = "${local.project_name_integration_test}"
  project_description = "${var.project_description}"
  build_spec          = "${var.test_spec}"
  build_timeout       = "${var.build_timeout}"
  tags                = "${var.tags}"

  builder_size     = "${var.builder_size}"
  builder_image    = "${var.builder_image}"
  builder_role_arn = "${local.builder_role_arn}"

  github_repo        = "${local.codebuild_github_repo}"
  github_clone_depth = "${var.github_clone_depth}"

  env_keys = ["${var.env_keys}"]
  env_vals = ["${var.env_vals}"]

  vpc_id          = "${var.vpc_id}"
  subnets         = ["${var.subnets}"]
  security_groups = ["${var.security_groups}"]
}
