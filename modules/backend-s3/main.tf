# ------------------------------------------------------------------------------------------------------------------
# LOCALS
# ------------------------------------------------------------------------------------------------------------------

locals {
  tags = merge(
    {
      Role = "Terraform Remote Backend"
    },
    var.tags
  )
  lockKey = "LockID"
}

# ------------------------------------------------------------------------------------------------------------------
# CREATE S3 BUCKET TO STORE TERRAFORM STATE AT
# ------------------------------------------------------------------------------------------------------------------

resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.bucket
  acl    = "private"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = merge(
    {
      Name = var.bucket
    },
    local.tags
  )
}

# ------------------------------------------------------------------------------------------------------------------
# CREATE DYNAMODB TABLE FOR LOCKING
# To use DynamoDB for locking with Terraform, you must create a DynamoDB table
# that has a primary key called LockID (with this exact spelling and capitalization)
# ------------------------------------------------------------------------------------------------------------------

resource "aws_dynamodb_table" "dynamodb_table" {
  name         = var.dynamodb_table
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = local.lockKey

  attribute {
    name = local.lockKey
    # (S)tring
    type = "S"
  }

  tags = local.tags
}
