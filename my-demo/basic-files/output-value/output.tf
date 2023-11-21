provider "aws" {
  region  = "us-east-1"
  profile = "tf"
}

resource "aws_eip" "test" {
  domain   = "vpc"
}
output "eip_value" { #this "eip_value" is the custom name we can set to output, we can any name here
  value = aws_eip.test.public_ip #use format same as cross account referance <resource-name>.<local-name>.<attributes-hold-value>
                                 ##here the public ip is the attributes which hold the value for public ip
}

output "allocation_id" {
    value = aws_eip.test.allocation_id
}

output "in_http_format" {
    value = "https://${aws_eip.test.public_ip}:8080"
}

#this will print all value from atrubutes as we have not define any
 output "default" {
    value = aws_eip.test
 }
