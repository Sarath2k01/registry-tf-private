output "BucketName" {
  description = "S3 bucket name"
  value       = awscc_s3_bucket.this.bucket_name
}

output "Arn" {
  description = "Bucket ARN"
  value       = awscc_s3_bucket.this.arn
}

output "DomainName" {
  description = "Bucket domain name"
  value       = awscc_s3_bucket.this.domain_name
}

output "RegionalDomainName" {
  description = "Region-specific bucket domain name"
  value       = awscc_s3_bucket.this.regional_domain_name
}

output "DualStackDomainName" {
  description = "Dual-stack bucket domain name"
  value       = awscc_s3_bucket.this.dual_stack_domain_name
}

output "WebsiteURL" {
  description = "Static website hosting URL"
  value       = awscc_s3_bucket.this.website_url
}

output "Tags" {
  description = "Tags in CloudControl [{Key, Value}] shape"
  value       = awscc_s3_bucket.this.tags
}

output "VersioningConfiguration" {
  description = "Versioning configuration in CloudControl shape"
  value       = awscc_s3_bucket.this.versioning_configuration
}

output "PublicAccessBlockConfiguration" {
  description = "Public access block in CloudControl shape"
  value       = awscc_s3_bucket.this.public_access_block_configuration
}

output "OwnershipControls" {
  description = "Ownership controls in CloudControl shape"
  value       = awscc_s3_bucket.this.ownership_controls
}

output "BucketEncryption" {
  description = "Server-side encryption in CloudControl shape"
  value       = awscc_s3_bucket.this.bucket_encryption
}