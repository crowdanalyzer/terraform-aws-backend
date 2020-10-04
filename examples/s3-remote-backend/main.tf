# ------------------------------------------------------------------------------------------------------------------
# DEPLOY AN S3 BUCKET SAVING THE TERRAFORM STATE IN THE S3 BUCKET CREATED BY THE S3-BACKEND EXAMPLE
# This example shows how to use the s3 bucket and dynamodb table generated by the s3-backend example
# as a remote backend for terraform state.
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
# DEPLOY AN S3 BUCKET
# ------------------------------------------------------------------------------------------------------------------

resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.bucket_name
  acl    = "private"

  tags = merge(
    {
      Name = var.bucket_name
      Role = "Remote Backend for Terraform Demo"
    },
    var.tags
  )
}
