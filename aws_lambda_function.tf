resource "aws_cloudwatch_log_group" "lambda" {
  name              = "/aws/lambda/${var.project-name}-${var.env}-${var.name}"
  retention_in_days = var.log-retention-days
  tags = {
    CostType = "logs"
  }
}

resource "aws_lambda_function" "lambda" {
  filename      = "lambda.zip"
  source_code_hash = filebase64sha256("lambda.zip")
  function_name = "${var.project-name}-${var.env}-${var.name}"
  role          = var.lambda-role
  architectures = var.architectures
  handler       = var.handler
  runtime       = var.runtime
  memory_size   = var.memory-size
  timeout       = var.timeout
  layers        = [for layer in data.aws_lambda_layer_version.lambda : layer.arn]
  ephemeral_storage {
    size = var.ephemeral-storage-size // Ephemeral storage min 512 MB max 10240 MB
  }
  vpc_config {
    subnet_ids         = var.subnet-ids
    security_group_ids = var.security-group-ids
  }
  dynamic "tracing_config" {
    for_each = var.tracing-mode == null ? [] : [true]
    content {
      mode = var.tracing-mode
    }
  }
  dynamic "environment" {
    for_each = length(keys(var.environment-variables)) == 0 ? [] : [true]
    content {
      variables = var.environment-variables
    }
  }
  tags = {
    Name         = "${var.project-name}-${var.env}-${var.name}"
    BackupPolicy = "n/a"
    AccessTier   = "private"
    CostType     = "lambda"
  }  
}

data "aws_lambda_layer_version" "lambda" {
  for_each = toset(var.lambda-layers)
  layer_name = each.value
}
