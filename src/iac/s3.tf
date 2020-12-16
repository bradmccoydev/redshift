resource "aws_s3_bucket" "redshift" {
  bucket = "redshift-hackathon-20201216-source-aligned"
  tags     = var.tags
  versioning {
    enabled = true
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}