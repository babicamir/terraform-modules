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
variable "lambda_layers" {
  description = "List of Lambda layer versions"
  type        = list(string)
  default     = [""]
}




variable "aws_s3_bucket_notification_enabled" {
  type        = bool
  default     = false
}
variable "aws_s3_bucket_notification_name" {
  type        = string
  default = ""
}

variable "aws_s3_bucket_notification_filter_prefix" {
  type        = string
  default = ""
}
variable "aws_s3_bucket_notification_filter_suffix" {
  type        = string
  default = ""
}

