resource "random_integer" "0" {
  min = 1
  max = 999999

  keepers {
    role_arn = "${aws_iam_role.0.arn}"
  }
}
