# terraform/main.tf

# --- AWS Provider Configuration ---
provider "aws" {
  region = var.aws_region # Using a variable from terraform/variables.tf
}

# --- Call the VPC module ---
module "vpc" {
  source               = "./modules/vpc" # Relative path to your VPC module
  vpc_cidr_block       = var.vpc_cidr_block       # Pass root variable to module
  public_subnet_cidrs  = var.public_subnet_cidrs  # Pass root variable to module
  private_subnet_cidrs = var.private_subnet_cidrs # Pass root variable to module
  azs                  = var.azs                  # Pass root variable to module
  project_name         = var.project_name         # Pass root variable to module
  environment          = var.environment          # Pass root variable to module
}

# --- Placeholder for future modules ---
# module "s3_bucket" {
#   source        = "./modules/s3"
#   bucket_name   = "your-unique-file-uploader-bucket-${var.environment}"
#   project_name  = var.project_name
#   environment   = var.environment
# }

# ... and so on for other modules
