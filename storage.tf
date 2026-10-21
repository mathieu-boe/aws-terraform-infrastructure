data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

resource "aws_s3_bucket" "operational_reports" {
  bucket = format(
    "aws-devops-ops-reports-%s-%s-an",
    data.aws_caller_identity.current.account_id,
    data.aws_region.current.region
  )

  bucket_namespace = "account-regional"

  tags = {
    Name        = "${var.environment}-operational-reports"
    Environment = var.environment
    Purpose     = "Infrastructure operational reports"
  }
}

resource "aws_s3_bucket_public_access_block" "operational_reports" {
  bucket = aws_s3_bucket.operational_reports.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "operational_reports" {
  bucket = aws_s3_bucket.operational_reports.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_versioning" "operational_reports" {
  bucket = aws_s3_bucket.operational_reports.id

  versioning_configuration {
    status = "Enabled"
  }
}
