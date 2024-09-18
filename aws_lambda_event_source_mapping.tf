# resource "aws_lambda_event_source_mapping" "example" {
#   event_source_arn = aws_sqs_queue.sqs_queue_test.arn
#   function_name    = aws_lambda_function.example.arn
# }

















resource "aws_s3_bucket_notification" "bucket_notification" {
  count = var.aws_s3_bucket_notification_enabled ? 1 : 0
  bucket = var.aws_s3_bucket_notification_name

  lambda_function {
    #id = "lambda-${var.project-name}-${var.env}-${var.name}"
    lambda_function_arn = aws_lambda_function.lambda.arn
    events              = var.aws_s3_bucket_notification_events
    filter_prefix       = var.aws_s3_bucket_notification_filter_prefix
    filter_suffix       = var.aws_s3_bucket_notification_filter_suffix 
  }

  lambda_function {
    #id = "lambda-${var.project-name}-${var.env}-${var.name}"
    lambda_function_arn = "arn:aws:lambda:us-east-1:647692764445:function:solution-1-dev-test4"
    events              = var.aws_s3_bucket_notification_events
    filter_prefix       = var.aws_s3_bucket_notification_filter_prefix
    filter_suffix       = var.aws_s3_bucket_notification_filter_suffix 
  }



  
  depends_on = [aws_lambda_permission.allow_s3_to_call_lambda]
}

resource "aws_lambda_permission" "allow_s3_to_call_lambda" {
  count = var.aws_s3_bucket_notification_enabled ? 1 : 0
  statement_id  = "AllowS3Invoke-${var.env}-${var.name}"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda.function_name
  principal     = "s3.amazonaws.com"
  source_arn    = data.aws_s3_bucket.aws_s3_bucket_notification_name[0].arn
}



data "aws_s3_bucket" "aws_s3_bucket_notification_name" {
  count = var.aws_s3_bucket_notification_enabled ? 1 : 0  
  bucket = var.aws_s3_bucket_notification_name
}