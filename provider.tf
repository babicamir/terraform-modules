##########################################
#AWS
##########################################
provider "aws" {
  region  = var.aws-region
  assume_role {
    role_arn = var.deployment-role
  }
  default_tags {
    tags = {
      Project     = var.project-name
      ManageBy    = "With terraform"
      Environment = var.env
    }
  }
}

##########################################
# Other providers
##########################################
terraform {
  backend "s3" {}
  required_providers {
    # AWS
    aws = {
      source  = "hashicorp/aws"
      version = "5.56.1"
    }
  }
}