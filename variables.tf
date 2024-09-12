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
variable "role" {
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
  type        = string
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









 