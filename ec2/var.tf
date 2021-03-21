provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "terraform-state-ledivan"
    key    = "state"
    region = "us-east-1"
  }
}
data "aws_ami" "ec2-linux" {
  most_recent = true
  owners      = ["137112412989"]
  filter {
    name   = "name"
    values = ["amzn2-ami-*-x86_64-gp2"]

  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }
}

variable "subnet" {
  default = {
    "us-east-1d"  = "subnet-11883c20"
 }
}

variable "vpc" {
  default = "vpc-ba2d90c7"

}

