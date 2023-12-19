#https://developer.hashicorp.com/terraform/cli/commands/import
provider "aws" {
  region  = "us-east-1"
  profile = "tf"
}
#https://github.com/mayurmadan/terraform-beginner-to-advanced-resource/blob/master/Section%205%20-%20Remote%20State%20Management/tf-import.md
#use import with to <resource-name>.<custom-local-name>
            #here id is sg group id
#use command to import 
#here file with mysg created with configuration
#terraform plan --generate-config-out=mysg.tf   

#then again reapply it to update .tfstate file
import {
  to = aws_security_group.mysg
  id = "sg-0615c8c6e5c383ac5"
}

#terraform plan --generate-config-out=ec2.tf 
import {
  to = aws_instance.myec2
  id = "i-0d9286ba7525151e8"
}
