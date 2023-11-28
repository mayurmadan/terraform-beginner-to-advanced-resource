provider "aws" {
  region  = "us-east-1"
  profile = "tf"
}

#https://developer.hashicorp.com/terraform/language/meta-arguments/lifecycle
resource "aws_instance" "name" {
    ami = "ami-0230bd60aa48260c6"
    instance_type = "t2.micro"
    tags = {        
        Name = "tf-demo"
    } 
    
    lifecycle {
      #using this terraform will ignore the manual chanage, keep as it is and we make manually.
      ignore_changes = [ instance_type ]

    #craete before desroy helps to create resource before destroy it if there is some argument changes[ami] 
    #(as ami chnages by default terraform remove previous resource & recreate new one with new AMI specify in configuration)
      create_before_destroy = true

      #now prevent destroy for particular resource 
    } 
}

resource "aws_instance" "db_instance" {
  ami = "ami-0230bd60aa48260c6"
  instance_type = "t2.micro"
  tags = {
    name = "database-server"
  }
  #this will avoid destroy for this db_instance even after terraform destroy commands
  lifecycle {
    prevent_destroy = true
  }
}



