provider "aws" {
  region  = "us-east-1"
  profile = "tf"
}

#https://developer.hashicorp.com/terraform/language/values/locals
locals {
  # Common tags to be assigned to all resources
  common_tags = {
    used_for = "test"
    Owner   = "mayur"
  }
}

resource "aws_instance" "Web" {
  ami           = var.ami_id
  instance_type = "t2.micro"
  count = 1
  tags = local.common_tags 
}

