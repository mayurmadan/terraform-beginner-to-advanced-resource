#https://github.com/mayurmadan/terraform-beginner-to-advanced-resource/tree/master/Section%205%20-%20Remote%20State%20Management/remote-states
provider "aws" {
  region  = "us-east-1"
  profile = "tf"
}

terraform {
  backend "s3" {
    profile = "tf"
    bucket = "remote-backend-tf"
    #if want to store in subfolder of bucket
    key = "projectA-IP/lock.tfstate"
    region = "us-east-1"
    ##this is the name of dynomodb table
   # dynamodb_table = "tf-state"
  }
}
resource "aws_eip" "sample" {
    tags = {
      name = "for-test"
    }
}
output "eip_output" {
  value = aws_eip.sample.public_ip
}
