AWS File Upload Platform - Project Overview
This document provides an overview of the AWS-based architecture for a file upload and metadata
tracking system.
The system allows users to authenticate, upload files to Amazon S3, and store associated metadata
in Amazon RDS (PostgreSQL).
Deployment is handled using Terraform.
Key Components:
- Amazon S3 for object storage
- Amazon RDS (PostgreSQL) for metadata
- AWS Lambda for serverless backend logic
- Amazon API Gateway for HTTP endpoints
- Amazon Cognito for user authentication
- Terraform for infrastructure deployment
Workflow:
1. User authenticates with Amazon Cognito.
2. Requests a pre-signed S3 URL from API Gateway.
3. Uploads the file directly to S3.
4. Sends metadata to another endpoint.
5. Lambda stores metadata in PostgreSQL.

### Initializing Terraform for Different Environments

To initialize the Terraform backend for a specific environment, navigate to the `terraform` directory and run the `terraform init` command with the appropriate `key` parameter. This ensures your state file is stored correctly in the shared S3 backend.

*   **For the Development Environment:**
    ```bash
    terraform init -backend-config="key=file-uploader/environments/dev/terraform.tfstate"
    ```
*   **For the Staging Environment:**
    ```bash
    terraform init -backend-config="key=file-uploader/environments/staging/terraform.tfstate"
    ```
*   **For the Production Environment:**
    ```bash
    terraform init -backend-config="key=file-uploader/environments/prod/terraform.tfstate"
    ```
    Terraform initializes the backend, installs provider plugins, and downloads modules. After running the command, Terraform creates a dependency lock file (.\terraform.lock.hcl) to record the versions of the providers. This file should be committed to your version control system to ensure consistent provider versions across environments and team members, according to Zeet.co.

---

**Remember to replace `yourname-file-uploader-tf-state`, `us-east-1`, and `yourname-file-uploader-tf-lock` in `terraform/backend.tf` with your actual bucket name, region, and DynamoDB table name.**
