# ------------------------------------------------------------------------------------------------------------------
# DEPLOY AN S3 BUCKET THAT CAN BE USED AS A REMOTE BACKEND FOR TERRAFORM
# This example shows how to use the backend-s3 module to deploy
# an s3 bucket that can be used as a remote backend for terraform state.
# It also deploys a dynamodb table to be used for locking.
# ------------------------------------------------------------------------------------------------------------------

# ------------------------------------------------------------------------------------------------------------------
# REQUIRE A SPECIFIC TERRAFORM VERSION OR HIGHER
# This module has been developed with 0.13 syntax, which means it is not compatible with any versions below 0.13.
# ------------------------------------------------------------------------------------------------------------------

terraform {
  required_version = ">= 0.13, < 0.14"
}

# ------------------------------------------------------------------------------------------------------------------
# AWS PROVIDER
# ------------------------------------------------------------------------------------------------------------------

provider "aws" {
  region = var.region
}

# ------------------------------------------------------------------------------------------------------------------
# DEPLOY ELASTICSEARCH CLUSTER BACKUP LAMBDA FUNCTION
# ------------------------------------------------------------------------------------------------------------------

module "s3_backend" {
  source = "../../modules/backend-s3"

  bucket         = var.bucket
  dynamodb_table = var.dynamodb_table
}
