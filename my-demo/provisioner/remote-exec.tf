#https://developer.hashicorp.com/terraform/language/resources/provisioners/remote-exec
#default sg used in which 22 & 80 are allow
resource "aws_instance" "test-provisoer" {
    ami = "ami-053b0d53c279acc90"
    instance_type = "t2.micro"
    key_name = "my-key"
    tags = {
      name = "remote-exec"
    }
    connection {
    type     = "ssh"
    user     = "ubuntu"
    private_key = file("./my-key.pem")
    host     = self.public_dns
  }
   provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo apt-get install nginx -y",
      "sudo systemctl enable nginx"
    ]
  }
}

output "private_dns" {
  value = aws_instance.test-provisoer.public_dns
}