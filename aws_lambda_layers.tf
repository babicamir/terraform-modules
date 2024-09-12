resource "aws_lambda_layer_version" "test1" {
  count = var.enable_lambda_layer ? 1 : 0
  layer_name          = "${var.project-name}-${var-env}-${var.name}"
  description         = "Description test"
  compatible_runtimes = var.architectures
  s3_bucket           = "lambda-layers"
  s3_key              = "assemblyai_layer/assemblyai_layer.zip"
}