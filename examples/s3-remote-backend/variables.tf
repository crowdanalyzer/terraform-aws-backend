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
  description = "The name of the s3 bucket that is used for this module."
  type        = string
  default     = "sansa-stark.remote-backends.terraform.example"
}

variable "region" {
  description = "The region where the s3 bucket exists."
  type        = string
  default     = "us-east-1"
}

variable "tags" {
  description = "The tags that should be associated with the resources created by this module."
  type        = map(string)
  default     = {}
}
