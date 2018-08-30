resource "aws_iam_role" "0" {
  name               = "${local.project_name}-codepipeline"
  assume_role_policy = "${file("${path.module}/role-codepipeline.json")}"
}

data "template_file" "0" {
  template = "${file("${path.module}/policy-codepipeline.json.tpl")}"

  vars {
    arn_s3_bucket   = "${aws_s3_bucket.0.arn}"
    arn_codebuild   = "${module.codebuild.github_id[0]}"
    region          = "${local.region}"
    account_id      = "${local.account_id}"
    cluster         = "${var.ecs_cluster}"
    task_definition = "${var.ecs_task_definition}"
    ecr_repo_arn    = "${local.ecr_repo_arn}"
  }
}

resource "aws_iam_role_policy" "0" {
  role   = "${aws_iam_role.0.name}"
  policy = "${data.template_file.0.rendered}"
}

resource "aws_iam_role" "1" {
  name               = "${local.codebuild_iam_role_name}"
  assume_role_policy = "${file("${path.module}/role-codebuild.json")}"
}

data "template_file" "1" {
  template = "${file("${path.module}/policy-codebuild.json.tpl")}"

  vars {
    arn_s3_bucket = "${aws_s3_bucket.0.arn}"
    region        = "${local.region}"
    account_id    = "${local.account_id}"
    ecr_repo_arn  = "${local.ecr_repo_arn}"
  }
}

resource "aws_iam_role_policy" "1" {
  role   = "${aws_iam_role.1.name}"
  policy = "${data.template_file.1.rendered}"
}
