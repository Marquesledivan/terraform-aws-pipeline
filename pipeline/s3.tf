resource "aws_s3_bucket" "codepipeline_bucket" {
  bucket        = var.namebucket
  acl           = "private"
  force_destroy = true
  versioning {
    enabled = true
  }
  lifecycle_rule {
    prefix  = "config/"
    enabled = true

    noncurrent_version_transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }

    noncurrent_version_transition {
      days          = 60
      storage_class = "GLACIER"
    }

    noncurrent_version_expiration {
      days = 90
    }
  }
}