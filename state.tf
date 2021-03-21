terraform {
  backend "s3" {
    bucket = "terraform-state-ledivan"
    key    = "state-pipeline"
    region = "us-east-1"
  }
}