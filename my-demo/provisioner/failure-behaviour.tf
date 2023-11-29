#https://developer.hashicorp.com/terraform/language/resources/provisioners/remote-exec
resource "aws_instance" "nginx" {
    ami = "ami-053b0d53c279acc90"
    instance_type = "t2.micro"
    #already created key in aws console , below we mention the private key from key pair
    key_name = "my-key"
    tags = {
      name = "web-server"
    }

    connection {
    type     = "ssh"
    host     = self.public_ip
    user     = "ubuntu"

    #https://developer.hashicorp.com/terraform/language/functions/file
    private_key = "${file("./my-key.pem")}"
  }
    provisioner "remote-exec" {
        #using this we can avoid taint the resource, so next time it will not destroy & recreate 
        on_failure = continue
    inline = [ 
        "sudo apt update" ,
        "sudo apt-get install nginx -y",
        "sudo systemctl enable nginx -y",
        ]
    
    }
}

