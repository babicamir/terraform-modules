##########################################################
# Default Variables
##########################################################
variable "project-name" {
  description = "Project (client) name"
  type        = string
}
variable "env" {
  description = "Current environment"
  type        = string
}
variable "name" {
  description = "Resource name"
  type        = string
}
variable "aws-region" {
  description = "AWS region name"
  type        = string
}


##########################################################
# Lambda Variables
##########################################################
variable "lambda-role" {
  type        = string
}
variable "subnet_ids" {
}
variable "security_group_ids" {
}
variable "architectures" {
}
variable "handler" {
  type        = string
}
variable "runtime" {
}
variable "memory_size" {
  type        = string
}
variable "timeout" {
  type        = string
}
variable "ephemeral_storage_size" {
  type        = string
}
variable "log_retention_days" {
  type        = string
}
variable "enable_lambda_layer" {
  type        = bool
  default     = false
}

variable "lambda-layer-description" {
  type        = string
  default     = ""
}
variable "create_lambda_layer_version" {
  type        = bool
  default     = false
}
variable "environment_variables" {
}
variable "tracing_mode" {
  default     = "Active"
}
variable "deployment-role" {
  type        = string
}

variable "provisioned_concurrent_executions" {
  description = "Amount of capacity to allocate. Set to 1 or greater to enable, or set to 0 to disable provisioned concurrency."
  type        = number
  default     = -1
}

variable "layers" {
  description = "List of Lambda Layer Version ARNs (maximum of 5) to attach to your Lambda Function."
  type        = list(string)
  default     = null
}


variable "lambda_layer_versions" {
  description = "List of Lambda layer versions"
  type        = list(string)
  default     = ["layer_version_1", "layer_version_2", "layer_version_3"]
}

# resource "aws_lambda_layer_version" "example" {
#   for_each = toset(var.lambda_layer_versions)

#   layer_name  = each.value
#   description = "Lambda layer version ${each.value}"
#   compatible_runtimes = ["python3.8"]
#   s3_bucket = "my-bucket"
#   s3_key    = "path/to/my-layer.zip"
# }



data "aws_lambda_layer_version" "existing" {
  for_each = toset(var.lambda_layer_versions)
  layer_name = each.value
}