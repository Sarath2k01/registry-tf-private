variable "BucketName" {
  description = "S3 bucket name (maps 1:1 to CloudControl BucketName)"
  type        = string
}

variable "Tags" {
  description = "Tags as a map. Emitted in CloudControl [{Key, Value}] shape via outputs."
  type        = map(string)
  default     = {}
}

variable "VersioningStatus" {
  description = "Versioning status: Enabled | Suspended (maps to CloudControl VersioningConfiguration.Status)"
  type        = string
  default     = "Enabled"
  validation {
    condition     = contains(["Enabled", "Suspended"], var.VersioningStatus)
    error_message = "VersioningStatus must be Enabled or Suspended."
  }
}

variable "PublicAccessBlockConfiguration" {
  description = "Maps 1:1 to CloudControl PublicAccessBlockConfiguration"
  type = object({
    BlockPublicAcls       = optional(bool, true)
    BlockPublicPolicy     = optional(bool, true)
    IgnorePublicAcls      = optional(bool, true)
    RestrictPublicBuckets = optional(bool, true)
  })
  default = {}
}

variable "OwnershipControls" {
  description = "ObjectOwnership value (maps to CloudControl OwnershipControls.Rules[0].ObjectOwnership)"
  type        = string
  default     = "BucketOwnerEnforced"
  validation {
    condition     = contains(["BucketOwnerEnforced", "BucketOwnerPreferred", "ObjectWriter"], var.OwnershipControls)
    error_message = "OwnershipControls must be BucketOwnerEnforced, BucketOwnerPreferred, or ObjectWriter."
  }
}

variable "SSEAlgorithm" {
  description = "Server-side encryption algorithm: AES256 | aws:kms"
  type        = string
  default     = "AES256"
}

variable "KMSMasterKeyID" {
  description = "KMS key ID when SSEAlgorithm = aws:kms; null for AES256"
  type        = string
  default     = null
}

variable "BucketKeyEnabled" {
  description = "Whether S3 Bucket Key is enabled (reduces SSE-KMS request costs)"
  type        = bool
  default     = false
}