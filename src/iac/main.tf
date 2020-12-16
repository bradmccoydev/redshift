# ---------------------------------------------------------------------------------------------------------------------
# Terraform State
# ---------------------------------------------------------------------------------------------------------------------
terraform {
  backend "s3" {
    bucket         = "redshift-hackathon-20201216"
    key            = "global/s3/terraform.tfstate"
    region         = "ap-southeast-2"
    dynamodb_table = "terraform_redshift_locks"
    encrypt        = true
  }
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = var.application_s3_bucket
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

resource "aws_dynamodb_table" "terraform_self_service_locks" {
  name         = "terraform_redshift_locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}