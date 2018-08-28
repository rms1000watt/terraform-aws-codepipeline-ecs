locals {
  path_root_list = "${split("/", path.root)}"
  path_root_len  = "${length(local.path_root_list)}"
  parent_dir     = "${element(local.path_root_list, local.path_root_len - 1)}"
}

locals {
  project_name      = "${var.project_name != "" ? var.project_name : local.parent_dir}"
  account_id        = "${data.aws_caller_identity.0.account_id}"
  pipeline_role_arn = "${var.pipeline_role_arn != "" ? var.pipeline_role_arn : aws_iam_role.0.arn}"

  codebuild_github_repo   = "git@github.com:${var.github_org}/${var.github_repo}.git?ref=${var.github_branch}"
  codebuild_iam_role_name = "${local.project_name}-codebuild"

  builder_role_arn = "${var.builder_role_arn != "" ? var.builder_role_arn : "arn:aws:iam::${local.account_id}:role/${local.codebuild_iam_role_name}"}" //"

  ecr_repo = "${var.ecr_repo != "" ? var.ecr_repo : local.project_name}"
}
