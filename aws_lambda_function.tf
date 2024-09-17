resource "aws_cloudwatch_log_group" "lambda" {
  name              = "/aws/lambda/${var.project-name}-${var.env}-${var.name}"
  retention_in_days = var.log_retention_days
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
  memory_size   = var.memory_size
  timeout       = var.timeout
  layers        = [for layer in data.lambda_layers.lambda : layer.arn]
  ephemeral_storage {
    size = var.ephemeral_storage_size // Ephemeral storage min 512 MB max 10240 MB
  }
  vpc_config {
    subnet_ids         = var.subnet_ids
    security_group_ids = var.security_group_ids
  }
  dynamic "tracing_config" {
    for_each = var.tracing_mode == null ? [] : [true]
    content {
      mode = var.tracing_mode
    }
  }
  dynamic "environment" {
    for_each = length(keys(var.environment_variables)) == 0 ? [] : [true]
    content {
      variables = var.environment_variables
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
  for_each = toset(var.lambda_layer_versions)
  layer_name = each.value
}
