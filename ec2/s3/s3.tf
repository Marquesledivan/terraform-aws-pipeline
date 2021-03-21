provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "terraform" {
  bucket = "terraform-state-ledivan"
  acl    = "private"

  tags = {
    Name        = "terraform"
    Environment = "state"
  }
}