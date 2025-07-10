# terraform/backend.tf
terraform {
  backend "s3" {
    bucket         = "tgray-file-uploader-tf-state" # Replace with your S3 bucket name
    #key            = "file-uploader/environments/dev/terraform.tfstate" # This path can be environment-specific
    region         = "us-east-1" # Replace with your chosen region
    dynamodb_table = "tgray-file-uploader-tf-lock" # Replace with your DynamoDB table name
    encrypt        = true # Ensures the state file is encrypted at rest in S3
  }
}
