##########################################
#AWS
##########################################
provider "aws" {
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
  # Terraform CLI version
  #required_version = "1.9.1"

   backend "s3" {
      bucket = "terraform-lambda-poc-amir"
      region = "us-east-1"
      key = "solution-1-terraform.tfstate"
      workspace_key_prefix = "solution-1"  #Team/project name
   }

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