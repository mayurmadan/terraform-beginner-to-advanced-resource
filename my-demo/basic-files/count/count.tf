provider "aws" {
  region  = "us-east-1"
  profile = "tf"
}
/*resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = "t2.micro"
}*/

#if want to create multiple resource of aws_instance use count 
 resource "aws_instance" "Web" {
  ami           = var.ami_id
  instance_type = "t2.micro"
  count = 3
}

#count index used to sepcify the unique index value for each resource if count is used, it will create 3 ec2 resource 
#with tag :- name = test1 , test2, test3 
 resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = "t2.micro"
  count = 3
  tags = {
    name = "test.${count.index}"
  }
}

#to avoid use of value from itegration as a suffix for name, useing variable list and count we can sepcify the proper name
 resource "aws_instance" "WEB" {
  ami           = var.ami_id
  instance_type = "t2.micro"
  count = 3
  tags = {
    name = var.tags[count.index]
  }
}



