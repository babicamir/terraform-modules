resource "aws_iam_user" "iam-user" {
  name = "${var.project-name}-${var.env}-${var.name}"
  path = "/"
  tags = {
    Name = "${var.project-name}-${var.env}-${var.name}"
  }
}