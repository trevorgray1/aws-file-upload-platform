# --- Common Infrastructure Module ---
# Create the VPC, subnets, security groups, etc.
module "common_infra" {
  source = "./modules/common" # Path to your common module
  
  # Pass common variables
  vpc_cidr_block = var.vpc_cidr_block
  public_subnet_cidr_blocks = var.public_subnet_cidr_blocks
  private_subnet_cidr_blocks = var.private_subnet_cidr_blocks
  # ... other common variables
}
