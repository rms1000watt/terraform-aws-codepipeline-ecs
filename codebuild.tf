module "codebuild" {
  source  = "rms1000watt/codebuild/aws"
  version = "0.1.12"

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
}
