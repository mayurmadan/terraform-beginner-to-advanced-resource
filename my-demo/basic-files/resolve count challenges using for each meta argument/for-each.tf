provider "aws" {
  region  = "us-east-1"
  profile = "tf"
}
#https://developer.hashicorp.com/terraform/language/meta-arguments/for_each

#example for IAm
#here 3 iam user created with name user-01 , user-02 & user-03
resource "aws_iam_user" "iam" {
  # here data type is list & convert into set (remove duplicate) & used the "for each" here the provide count & name
  for_each = toset( ["user-01","user-02", "user-03","user-02"] )
  name     = each.key
}

#example 2 ec2 
resource "aws_instance" "myec2" {
  ami = "ami-0fc5d935ebf8bc3bc"
  #here data type is map 
  for_each  = {
      dev = "t2.micro"
      prod = "t2.nano"
   }
   #here it used value from map t2.micro & t2.nano , create 2 ec2 with of this type
  instance_type    = each.value
  
# here it user access key as dev & prod for instances
  key_name         = each.key
  
  #provide tages as t2.micro & t2.nano
  tags =  {
   Name = each.value
    }
}
