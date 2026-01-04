output "vnet_id" {
  value = module.networking.vnet_id
}

output "audit_bucket_arn" {
  value = module.compliance_vault.s3_bucket_arn
  description = "The ARN of the AWS S3 bucket for cross-cloud audit logging."
}
