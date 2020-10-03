# ------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# ------------------------------------------------------------------------------------------------------------------

variable "bucket" {
  description = "The name of the s3 bucket that is used for storing terraform state."
  type        = string
}

variable "dynamodb_table" {
  description = "The name of the dynamodb table that is used for locking."
  type        = string
}

# ------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# ------------------------------------------------------------------------------------------------------------------

variable "enable_versioning" {
  description = "Whether the S3 bucket should have versioning enabled or not."
  type        = bool
  default     = true
}

variable "enable_encryption" {
  description = "Whether the S3 bucket should have encryption enabled or not."
  type        = bool
  default     = true
}

variable "tags" {
  description = "The tags that should be associated with the resources created by this module."
  type        = map(string)
  default     = {}
}
