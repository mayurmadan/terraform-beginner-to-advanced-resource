#https://github.com/mayurmadan/terraform-beginner-to-advanced-resource/blob/master/Section%202%20-%20Read%2C%20Generate%2C%20Modify%20Congiruations/data-sources.md
#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami#argument-reference
provider "aws" {
  region  = "ap-south-1"
  profile = "tf"
}

data "aws_ami" "app_ami" {
  most_recent = true
  owners = ["amazon"]


  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_instance" "instance-1" {
   ami = data.aws_ami.app_ami.id
   instance_type = "t2.micro"
}
