resource "aws_lambda_layer_version" "lambda" {
  count = var.enable_lambda_layer ? 1 : 0
  layer_name          = "${var.project-name}-${var.env}-${var.name}"
  description         = "Description test"
  compatible_runtimes = ["${var.runtime}"]
  s3_bucket           = "amir-test-test-1"
  s3_key              = "test.zip"
}