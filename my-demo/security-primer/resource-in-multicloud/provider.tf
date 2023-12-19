provider "aws" {
    region = "us-east-1"
    profile = "tf"
}
#use alias for region to created resource in this region & call this alias name in resouce configuration
provider "aws" {
  alias = "mumbai"
  region = "ap-south-1"
  profile = "tf"
}
