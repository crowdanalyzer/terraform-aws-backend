# S3 Backend with Versioning & Encryption Example

This folder contains a Terraform example for deploying an *S3* bucket that can be used as a *remote backend* for Terraform with *versioning* and *encryption* **enabled**. It also deploys a *DynamoDB* table to be used for locking.

The end result of this example is an S3 bucket and a dynamodb table.

## Quick Start

To deploy:

1. Modify `main.tf` to customize your AWS region.
2. Modify `variables.tf` to customize the bucket name and the dynamodb table name.
3. Run `terraform init`.
4. Run `terraform apply`.
5. Validate that both the s3 bucket and the dynamodb table has been created.
