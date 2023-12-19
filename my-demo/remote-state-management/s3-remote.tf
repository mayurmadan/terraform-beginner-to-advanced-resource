##https://developer.hashicorp.com/terraform/language/settings/backends/s3
provider "aws" {
  region  = "us-east-1"
  profile = "tf"
}
 resource "aws_instance" "Web" {
  ami           = "ami-053b0d53c279acc90"
  instance_type = "t2.micro"
}
