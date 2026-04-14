resource "aws_s3_bucket" "this" {
  bucket = var.BucketName
  tags   = var.Tags
}

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id
  versioning_configuration {
    status = var.VersioningStatus
  }
}

resource "aws_s3_bucket_public_access_block" "this" {
  bucket                  = aws_s3_bucket.this.id
  block_public_acls       = var.PublicAccessBlockConfiguration.BlockPublicAcls
  block_public_policy     = var.PublicAccessBlockConfiguration.BlockPublicPolicy
  ignore_public_acls      = var.PublicAccessBlockConfiguration.IgnorePublicAcls
  restrict_public_buckets = var.PublicAccessBlockConfiguration.RestrictPublicBuckets
}

resource "aws_s3_bucket_ownership_controls" "this" {
  bucket = aws_s3_bucket.this.id
  rule {
    object_ownership = var.OwnershipControls
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  bucket = aws_s3_bucket.this.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = var.SSEAlgorithm
      kms_master_key_id = var.KMSMasterKeyID
    }
    bucket_key_enabled = var.BucketKeyEnabled
  }
}