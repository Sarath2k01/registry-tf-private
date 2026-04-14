output "BucketName" {
  description = "S3 bucket name"
  value       = aws_s3_bucket.this.bucket
}

output "Arn" {
  description = "Bucket ARN"
  value       = aws_s3_bucket.this.arn
}

output "DomainName" {
  description = "Bucket domain name"
  value       = aws_s3_bucket.this.bucket_domain_name
}

output "RegionalDomainName" {
  description = "Region-specific bucket domain name"
  value       = aws_s3_bucket.this.bucket_regional_domain_name
}

output "DualStackDomainName" {
  description = "Dual-stack bucket domain name"
  value       = "${aws_s3_bucket.this.bucket}.s3.dualstack.${aws_s3_bucket.this.region}.amazonaws.com"
}

output "WebsiteURL" {
  description = "Static website hosting URL"
  value       = "http://${aws_s3_bucket.this.bucket}.s3-website-${aws_s3_bucket.this.region}.amazonaws.com"
}

output "Tags" {
  description = "Tags in CloudControl [{Key, Value}] shape"
  value       = [for k, v in aws_s3_bucket.this.tags_all : { Key = k, Value = v }]
}

output "VersioningConfiguration" {
  description = "Versioning configuration in CloudControl shape"
  value = {
    Status = aws_s3_bucket_versioning.this.versioning_configuration[0].status
  }
}

output "PublicAccessBlockConfiguration" {
  description = "Public access block in CloudControl shape"
  value = {
    BlockPublicAcls       = aws_s3_bucket_public_access_block.this.block_public_acls
    BlockPublicPolicy     = aws_s3_bucket_public_access_block.this.block_public_policy
    IgnorePublicAcls      = aws_s3_bucket_public_access_block.this.ignore_public_acls
    RestrictPublicBuckets = aws_s3_bucket_public_access_block.this.restrict_public_buckets
  }
}

output "OwnershipControls" {
  description = "Ownership controls in CloudControl shape"
  value = {
    Rules = [{ ObjectOwnership = aws_s3_bucket_ownership_controls.this.rule[0].object_ownership }]
  }
}

output "BucketEncryption" {
  description = "Server-side encryption in CloudControl shape"
  value = {
    ServerSideEncryptionConfiguration = {
      BucketKeyEnabled = one(aws_s3_bucket_server_side_encryption_configuration.this.rule).bucket_key_enabled
      ServerSideEncryptionByDefault = {
        SSEAlgorithm   = one(one(aws_s3_bucket_server_side_encryption_configuration.this.rule).apply_server_side_encryption_by_default).sse_algorithm
        KMSMasterKeyID = one(one(aws_s3_bucket_server_side_encryption_configuration.this.rule).apply_server_side_encryption_by_default).kms_master_key_id
      }
    }
  }
}