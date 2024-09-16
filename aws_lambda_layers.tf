resource "aws_lambda_layer_version" "lambda" {
  count = var.enable_lambda_layer ? 1 : 0
  layer_name          = "${var.project-name}-${var.env}-${var.name}"
  description         = var.lambda-layer-description
  compatible_runtimes = ["${var.runtime}"]
  s3_bucket           = "amir-dev-test-1"
  s3_key              = "test.zip"
}









# resource "aws_lambda_layer_version" "this" {
#   count = local.create && var.create_layer ? 1 : 0

#   layer_name   = var.layer_name
#   description  = var.description
#   license_info = var.license_info

#   compatible_runtimes      = length(var.compatible_runtimes) > 0 ? var.compatible_runtimes : [var.runtime]
#   compatible_architectures = var.compatible_architectures
#   skip_destroy             = var.layer_skip_destroy

#   filename         = local.filename
#   source_code_hash = var.ignore_source_code_hash ? null : (local.filename == null ? false : fileexists(local.filename)) && !local.was_missing ? filebase64sha256(local.filename) : null

#   s3_bucket         = local.s3_bucket
#   s3_key            = local.s3_key
#   s3_object_version = local.s3_object_version

#   depends_on = [null_resource.archive, aws_s3_object.lambda_package]
# }

# resource "aws_s3_object" "lambda_package" {
#   count = local.create && var.store_on_s3 && var.create_package ? 1 : 0

#   bucket        = var.s3_bucket
#   acl           = var.s3_acl
#   key           = local.s3_key
#   source        = data.external.archive_prepare[0].result.filename
#   storage_class = var.s3_object_storage_class

#   server_side_encryption = var.s3_server_side_encryption

#   tags = var.s3_object_tags_only ? var.s3_object_tags : merge(var.tags, var.s3_object_tags)

#   depends_on = [null_resource.archive]
# }


# resource "aws_lambda_layer_version" "this" {
#   count = local.create && var.create_layer ? 1 : 0

#   layer_name   = var.layer_name
#   description  = var.description
#   license_info = var.license_info

#   compatible_runtimes      = length(var.compatible_runtimes) > 0 ? var.compatible_runtimes : [var.runtime]
#   compatible_architectures = var.compatible_architectures
#   skip_destroy             = var.layer_skip_destroy

#   filename         = local.filename
#   source_code_hash = var.ignore_source_code_hash ? null : (local.filename == null ? false : fileexists(local.filename)) && !local.was_missing ? filebase64sha256(local.filename) : null

#   s3_bucket         = local.s3_bucket
#   s3_key            = local.s3_key
#   s3_object_version = local.s3_object_version

#   depends_on = [null_resource.archive, aws_s3_object.lambda_package]
# }