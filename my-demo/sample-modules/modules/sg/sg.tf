resource "aws_security_group" "ec2-sg" {
  name = "my_sg"
    ingress {
    description      = "TLS from VPC"
    from_port        = 440
    to_port          = local.tls_port
    protocol         = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "allow_tls"
  }
}
#using locals we cannot able to change the tls_port from root configuration file
locals {
  tls_port = "443"
}

#here I create output of security group id using output "sg_name", we can create the file for this like output.tf
#this value i use in ec2 root(parent module) configuration file
output "sg_name" {
  description = "value of sg id is"
  value = aws_security_group.ec2-sg.id[*]
}
