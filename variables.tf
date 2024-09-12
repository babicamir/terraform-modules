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


variable "key" {
  description = "The path to the state file inside the bucket"
  type        = string
  default = "solution-1-terraform.tfstate"
}