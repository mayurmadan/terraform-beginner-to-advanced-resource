provider "aws" {
  region  = "us-east-1"
  profile = "tf"
}
#https://developer.hashicorp.com/terraform/language/settings/backends/s3
terraform {
  backend "s3" {
    profile = "tf"
    bucket = "remote-backend-tf"
    #if want to store in subfolder of bucket
    key = "test-state-folder/lock.tfstate"
    region = "us-east-1"
    ##this is the name of dynomodb table
   # dynamodb_table = "tf-state"
  }
}
#sleep for 150 second
resource "time_sleep" "sample" {
  create_duration = "10s"
}

 resource "aws_instance" "Web" {
  ami           = "ami-053b0d53c279acc90"
  instance_type = "t2.micro"
private_dns_name_options {
enable_resource_name_dns_a_record    = false
   }
root_block_device {
    delete_on_termination = true
    encrypted             = false
    throughput            = 0
    volume_size           = 11
    volume_type           = "gp2"
    }
}   
