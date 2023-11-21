#credemtails are passed using aws profile , here name is "tf"
#https://medium.com/nerd-for-tech/configuration-and-credential-file-settings-in-aws-cli-61c7ff0a1cd6
provider "aws" {
  region  = "us-east-1"
  profile = "tf"
}

#reesource one [create EIP and use this attributes in below resources two]
resource "aws_eip" "test" {
  domain   = "vpc"
}


#resource two [create SG in default VPC and use above reosurces attributes in rule of sg, call above attributes in following format
#<resource-name.local-name.attributes hold actual value(find from offical docs or state file)>]
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls from resouce one"
  description = "Allow TLS inbound traffic"

  ingress {
    description      = "allow from reosuce one from EIP"
    from_port        = 2121
    to_port          = 2121
    protocol         = "tcp"
    cidr_blocks      = ["${aws_eip.test.public_ip}/32"] #here the public ip is the attributes which hold the value for public ip
    #https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip#public_ip, /32 is used for any CICR range in AWS
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["${aws_eip.test.public_ip}/32"]
  }

  tags = {
    Name = "allow_from_EIP_only"
  }
}
