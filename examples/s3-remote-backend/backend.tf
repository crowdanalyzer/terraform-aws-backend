# ------------------------------------------------------------------------------------------------------------------
# USE AN AMAZON S3 BUCKET TO REMOTELY STORE TERRAFORM STATE
# USE A DYNAMODB TABLE FOR STATE UPDATE LOCKS
# ------------------------------------------------------------------------------------------------------------------

terraform {
  backend "s3" {
    bucket = "aria-stark.remote-backend.terraform"
    key    = "examples/s3-remote-backend/terraform.tfstate"
    region = "us-east-1"

    dynamodb_table = "aria-stark-remote-backend-terraform-dynamodb-locks-table"
    encrypt        = true
  }
}
