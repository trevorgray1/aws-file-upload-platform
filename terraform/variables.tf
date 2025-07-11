# terraform/variables.tf (root level)

variable "project_name" {
  description = "Overall project name for tagging resources"
  type        = string
}

variable "environment" {
  description = "Deployment environment (e.g., dev, staging, prod)"
  type        = string
}

variable "aws_region" {
  description = "AWS region for deployments"
  type        = string
  default     = "us-east-1" # Can have a default, or be specified per env
}

# New variables for network configuration, declared at the root level
variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
}

variable "azs" {
  description = "List of Availability Zones to use for the VPC and subnets"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"] # Or define in .tfvars
}
# ... other project-wide variables
