provider "aws" {
  region = "us-west-2"
}

variable "github_oauth_token" {}

module "codepipeline" {
  source = "../.."

  github_org         = "rms1000watt"
  github_repo        = "dummy-golang-project"
  github_oauth_token = "${var.github_oauth_token}"
}
