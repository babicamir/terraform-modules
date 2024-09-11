# Terraform module: lambda-functions
module "lambda-functions" {
  source   = "./modules/iam-user"
  # Variables
    project-name         = var.project-name
    env  = var.env
    name = var.name

}
