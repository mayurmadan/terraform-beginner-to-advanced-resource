resource "aws_instance" "name" {
    ami = "ami-053b0d53c279acc90"
    instance_type = var.ec2_type
    vpc_security_group_ids = var.security_group_id
    tags = {        
        Name = "tf-demo"
    }
}
