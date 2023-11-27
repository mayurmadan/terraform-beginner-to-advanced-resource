  provider "aws" {
    region  = "us-east-1"
    profile = "tf"
  }
 
  resource "aws_instance" "name" {
    ami = "ami-053b0d53c279acc90"
    instance_type = "t2.micro"
    tags = {        
        Name = "tf-demo"
    } 
}

output "ec2_id" {
    value = aws_instance.name.arn
}

output "tag" {
    value = aws_instance.name.tags
}

#we have to pass resource name.localname.attributes format for zipmap
output "conbined-using-zipmap"{
    value = zipmap(["aws_instance.name.arn"],["aws_instance.name.tags"])
}
