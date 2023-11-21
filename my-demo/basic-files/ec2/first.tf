provider "aws" {
  region     = "us-east-1"
  access_key = "AKIA4JRP7OVBCBXZ6KGY"
  secret_key = "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"
}

resource "aws_instance" "name" {
    ami = "ami-053b0d53c279acc90"
    instance_type = "t2.micro"
    tags = {        
        Name = "tf-demo"
    } 
}
