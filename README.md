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

