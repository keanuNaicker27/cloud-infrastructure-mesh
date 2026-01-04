resource "aws_s3_bucket" "audit_vault" {
  bucket = "sentinel-audit-vault-${var.environment}"

  # Enable Object Lock for WORM compliance
  object_lock_enabled = true
}

resource "aws_s3_bucket_object_lock_configuration" "retention" {
  bucket = aws_s3_bucket.audit_vault.id

  rule {
    default_retention {
      mode = "COMPLIANCE" # Cannot be bypassed even by the root user
      days = 365
    }
  }
}
