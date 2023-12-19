terraform {
  backend "s3" {
    profile = "tf"
    bucket = "remote-backend-tf"
    #if want to store in subfolder of bucket
    key = "test-state-folder/terraform.tfstate"
    region = "us-east-1"
  }
}
