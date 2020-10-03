# ---------------------------------------------------------------------------------------------------------------------
# ENVIRONMENT VARIABLES
# Define these secrets as environment variables
# ---------------------------------------------------------------------------------------------------------------------

# AWS_ACCESS_KEY_ID
# AWS_SECRET_ACCESS_KEY

# ------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# ------------------------------------------------------------------------------------------------------------------

variable "bucket" {
  description = "The name of the s3 bucket that is used for storing terraform state."
  type        = string
  default     = "aria-stark.remote-backend.terraform"
}

variable "dynamodb_table" {
  description = "The name of the dynamodb table that is used for locking."
  type        = string
  default     = "aria-stark-remote-backend-terraform-dynamodb-locks-table"
}

variable "region" {
  description = "The region where the s3 bucket exists."
  type        = string
  default     = "us-east-1"
}
