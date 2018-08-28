resource "aws_s3_bucket" "0" {
  bucket = "${local.account_id}-codepipeline-${local.project_name}-${random_integer.0.result}"
  acl    = "private"
}
