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
variable "deployment-role" {
  type        = string
}

##########################################################
# Variables
##########################################################
variable "lambda-role" {
  type        = string
}
variable "subnet-ids" {
}
variable "security-group-ids" {
}
variable "architectures" {
}
variable "handler" {
  type        = string
}
variable "runtime" {
}
variable "memory-size" {
  type        = string
}
variable "timeout" {
  type        = string
}
variable "ephemeral-storage-size" {
  type        = string
}
variable "log-retention-days" {
  type        = string
}
variable "enable-lambda-layer" {
  type        = bool
  default     = false
}

variable "lambda-layer-description" {
  type        = string
  default     = ""
}
variable "create-lambda-layer-version" {
  type        = bool
  default     = false
}
variable "environment-variables" {
}
variable "tracing-mode" {
  default     = "Active"
}

variable "provisioned-concurrent-executions" {
  description = "Amount of capacity to allocate. Set to 1 or greater to enable, or set to 0 to disable provisioned concurrency."
  type        = number
  default     = -1
}
variable "lambda-layers" {
  description = "List of Lambda layer versions"
  type        = list(string)
  default     = [""]
}








variable "aws-lambda-event-source-dynamodb-stream-enabled" {
  type        = bool
  default     = false
}
variable "aws-lambda-event-source-dynamodb-name" {
  type        = string
  default = ""
}






