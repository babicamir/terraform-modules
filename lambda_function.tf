resource "aws_cloudwatch_log_group" "lambda" {
  name              = "/aws/lambda/${var.project-name}-${var.env}-${var.name}"
  retention_in_days = var.log_retention_days
  tags = {
    CostType = "logs"
  }
}

resource "aws_lambda_function" "lambda" {
  #filename      = var.filename
  function_name = "${var.project-name}-${var.env}-${var.name}"
  role          = var.role
  architectures = var.architectures
  handler       = var.handler
  runtime       = var.runtime
  memory_size   = var.memory_size
  timeout       = var.timeout
  #layers        = var.layers
  ephemeral_storage {
    size = var.ephemeral_storage_size // Ephemeral storage min 512 MB max 10240 MB
  }
  # environment {
  #   variables = var.environment_variables
  # }
  vpc_config {
    subnet_ids         = var.subnet_ids
    security_group_ids = var.security_group_ids
  }
  tags = {
    Name         = "${var.project-name}-${var.env}-${var.name}"
    BackupPolicy = "n/a"
    AccessTier   = "private"
    CostType     = "lambda"
  }
}

# resource "aws_lambda_permission" "lambda" {
#   statement_id  = "AllowExecutionFromS3Bucket"
#   action        = "lambda:InvokeFunction"
#   function_name = aws_lambda_function.lambda.arn
#   principal     = "s3.amazonaws.com"
#   source_arn    = "arn:aws:s3:::${var.name}-${var.env}"
# }