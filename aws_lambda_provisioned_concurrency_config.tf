
resource "aws_lambda_provisioned_concurrency_config" "lambda" {
  count =  var.provisioned_concurrent_executions > -1 ? 1 : 0

  function_name = aws_lambda_function.lambda.function_name
  qualifier     = aws_lambda_function.lambda.version

  provisioned_concurrent_executions = var.provisioned_concurrent_executions
}