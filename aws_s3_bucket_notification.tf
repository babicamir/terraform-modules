
# resource "aws_s3_bucket_notification" "bucket_notification" {
#   count = var.aws_s3_bucket_notification_enabled ? 1 : 0
#   bucket = var.aws_s3_bucket_notification_name

#   lambda_function {
#     #id = "lambda-${var.project-name}-${var.env}-${var.name}"
#     lambda_function_arn = aws_lambda_function.lambda.arn
#     events              = var.aws_s3_bucket_notification_events
#     filter_prefix       = var.aws_s3_bucket_notification_filter_prefix
#     filter_suffix       = var.aws_s3_bucket_notification_filter_suffix 
#   }

#   lambda_function {
#     #id = "lambda-${var.project-name}-${var.env}-${var.name}"
#     lambda_function_arn = "arn:aws:lambda:us-east-1:647692764445:function:solution-1-dev-test4"
#     events              = var.aws_s3_bucket_notification_events
#     filter_prefix       = "Folder4/"
#     filter_suffix       = var.aws_s3_bucket_notification_filter_suffix 
#   }
 
#   depends_on = [aws_lambda_permission.allow_s3_to_call_lambda]
# }

resource "aws_s3_bucket_notification" "example" {
  bucket = var.aws_s3_bucket_notification_name

  dynamic "lambda_function" {
    for_each = local.lambda_notifications
    content {
      id            = lambda_function.value.id
      lambda_function_arn = lambda_function.value.arn
      events        = ["s3:ObjectCreated:*"]
      filter_prefix       = lambda_function.value.filter_prefix
      # Add filter or other parameters if needed
    }
  }

  # Other blocks like 'queue' or 'topic' can be added here too
}


locals {
  lambda_notifications = {
    lambda1 = {
      id  = "test3"
      arn = "arn:aws:lambda:us-east-1:647692764445:function:solution-1-dev-test3"
      filter_prefix       = "Folder3/"
    }
    lambda2 = {
      id  = "test4"
      arn = "arn:aws:lambda:us-east-1:647692764445:function:solution-1-dev-test4"
      filter_prefix       = "Folder4/"
    }
 
  }
}

data "aws_ssm_parameter" "foo" {
  name = "foo"
}

resource "aws_ssm_parameter" "s3-lambda-trigger" {
  name  = "foo"
  type  = "String"
  value = "bar"
}

resource "aws_ssm_parameter" "s3-lambda-trigger" {
  name  = "/s3-lambda-trigger/json"
  type  = "String"  # Can also be 'SecureString' for encrypted values
  value = jsonencode({
    key1 = "value1"
    lambda2 = {
      id  = "test4"
      arn = "arn:aws:lambda:us-east-1:647692764445:function:solution-1-dev-test4"
      filter_prefix       = "Folder3/"
    })
  description = "A sample JSON object stored in SSM Parameter Store"
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