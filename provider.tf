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
    # tls ssh keys
    tls = {
      source  = "hashicorp/tls"
      version = "4.0.5"
    }
    # Random Provider
    random = {
      source  = "hashicorp/random"
      version = "3.6.2"
    }
    # Local Provider
    local = {
      source  = "hashicorp/local"
      version = "2.5.1"
    }
  }
}