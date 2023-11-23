  provider "aws" {
    region  = "us-east-1"
    profile = "tf"
  }

  resource "aws_security_group" "allow_tls" {
    name        = "allow_tls"
    description = "Allow TLS inbound traffic"

    ingress {
      description      = "TLS from VPC"
      from_port        = 443
      to_port          = 443
      protocol         = "tcp"
      cidr_blocks      = [var.allowed_ip]
    }
    ingress {
      description      = "TLS from VPC"
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = [var.allowed_ip]
    }
    egress {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
    }

    tags = {
      Name = "allow_tls"
    }
  }

  #runtime variable pass during terraform apply command like "terraform apply -var="allowed_ip_runtime=12.3.56.12/32"
  #if no value sepcify in variable.tf file it will ask while terraform apply
  resource "aws_security_group" "allow_tls_runtime" {
    name        = "allow_tls_runtime"
    description = "Allow TLS inbound traffic"

    ingress {
      description      = "TLS from VPC"
      from_port        = 443
      to_port          = 443
      protocol         = "tcp"
      cidr_blocks      = [var.allowed_ip_runtime]
    }
    ingress {
      description      = "TLS from VPC"
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = [var.allowed_ip_runtime]
    }
    egress {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
    }

    tags = {
      Name = "allow_tls"
    }
  }
