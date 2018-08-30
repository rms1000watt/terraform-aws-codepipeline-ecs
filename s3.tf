resource "aws_s3_bucket" "0" {
  bucket = "codepipeline-${local.project_name}-${local.account_id}"
  acl    = "private"
}
