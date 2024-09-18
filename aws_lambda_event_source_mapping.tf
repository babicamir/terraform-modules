resource "aws_lambda_event_source_mapping" "dynamodb" {
  count = var.aws_s3_bucket_notification_enabled ? 1 : 0
  event_source_arn = data.aws_dynamodb_table.dynamodb.stream_arn
  function_name    = aws_lambda_function.lambda.arn
}







data "aws_dynamodb_table" "dynamodb" {
  count = var.aws_s3_bucket_notification_enabled ? 1 : 0
  name = var.aws_lambda_event_source_dynamodb_name
}