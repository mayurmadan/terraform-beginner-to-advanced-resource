resource "aws_instance" "local-provisoer" {
    ami = "ami-053b0d53c279acc90"
    instance_type = "t2.micro"
    key_name = "my-key"
    tags = {
      name = "remote-exec"
    }
    provisioner "local-exec" {
    command = "echo ${self.private_ip} >> private_ips.txt"
  }
}
