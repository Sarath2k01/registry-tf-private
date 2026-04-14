resource "awscc_s3_bucket" "this" {
  bucket_name = var.BucketName

  versioning_configuration = {
    status = var.VersioningStatus
  }

  public_access_block_configuration = {
    block_public_acls       = var.PublicAccessBlockConfiguration.BlockPublicAcls
    block_public_policy     = var.PublicAccessBlockConfiguration.BlockPublicPolicy
    ignore_public_acls      = var.PublicAccessBlockConfiguration.IgnorePublicAcls
    restrict_public_buckets = var.PublicAccessBlockConfiguration.RestrictPublicBuckets
  }

  ownership_controls = {
    rules = [{
      object_ownership = var.OwnershipControls
    }]
  }

  bucket_encryption = {
    server_side_encryption_configuration = [{
      bucket_key_enabled = var.BucketKeyEnabled
      server_side_encryption_by_default = {
        sse_algorithm     = var.SSEAlgorithm
        kms_master_key_id = var.KMSMasterKeyID
      }
    }]
  }

  tags = [for k, v in var.Tags : { key = k, value = v }]
}