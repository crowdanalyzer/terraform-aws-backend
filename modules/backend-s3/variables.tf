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

variable "tags" {
  description = "The tags that should be associated with the resources created by this module."
  type        = map(string)
  default     = {}
}
