variable "aws_region" {
  description = "The AWS region to deploy resources."
  type        = string
  default     = "us-east-1" # Set a default region if you want to
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the Virtual Private Cloud (VPC)."
  type        = string
}

variable "public_subnet_cidr_blocks" {
  description = "A list of CIDR blocks for the public subnets."
  type        = list(string)
}

variable "private_subnet_cidr_blocks" {
  description = "A list of CIDR blocks for the private subnets."
  type        = list(string)
}

variable "app_s3_bucket_name" {
  description = "The name of the S3 bucket for the application data."
  type        = string
}

variable "rds_db_name" {
  description = "The name of the RDS database."
  type        = string
}

variable "rds_engine" {
  description = "The database engine for RDS (e.g., postgres, mysql)."
  type        = string
}

variable "rds_instance_class" {
  description = "The instance class for the RDS database."
  type        = string
}

variable "rds_allocated_storage" {
  description = "The allocated storage for the RDS database (in GiB)."
  type        = number
}

variable "rds_master_username" {
  description = "The master username for the RDS database."
  type        = string
}

variable "rds_master_password" {
  description = "The master password for the RDS database."
  type        = string
  sensitive   = true # Mark sensitive to prevent it from being displayed in output
}

variable "cognito_user_pool_name" {
  description = "The name of the Cognito user pool."
  type        = string
}

variable "lambda_function_name" {
  description = "The name of the Lambda function."
  type        = string
}

variable "lambda_handler" {
  description = "The handler function for the Lambda function (e.g., index.handler)."
  type        = string
}

variable "lambda_runtime" {
  description = "The runtime for the Lambda function (e.g., nodejs16.x, python3.9)."
  type        = string
}

variable "lambda_package_path" {
  description = "The path to the Lambda deployment package (ZIP file)."
  type        = string
}

variable "api_gateway_name" {
  description = "The name of the API Gateway REST API."
  type        = string
}

# Add any other variables that are relevant at the root level and need to be passed down
# to the modules.