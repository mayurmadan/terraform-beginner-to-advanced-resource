provider "aws" {
  region  = "us-east-1"
  profile = "tf"
}

 resource "aws_instance" "dev" {
  ami           = var.ami_id
  instance_type = "t2.micro"
  #if var.env is true then launch t2.micro [dev] of count 2
  #count = var.isenv == true ? 1 : 0
  count = var.isenv == true ? 2 : 0
  
  ##refer count folder code, if not understand 
  /*tags = {
    name = var.isenv[count.index]
  }*/ 
}

 resource "aws_instance" "prod" {
  ami           = var.ami_id
  instance_type = "t2.large"
  #if var.env is false then lauch t2.large of count 2 
  count = var.isenv == false ? 1 : 0

  ##refer count folder code, if not understand 
  /*tags = {
    name = var.isenv[count.index]
  }*/
}
