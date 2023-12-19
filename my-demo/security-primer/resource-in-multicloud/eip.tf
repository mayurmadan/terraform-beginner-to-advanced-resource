resource "aws_eip" "eip-default" {
    tags = {
      name = "us-east1-eip"
    }
}
resource "aws_eip" "eip-mumbai" {
    #call alias here,to create the eip in mumbai region[ap-south-1]
    provider = aws.mumbai
    tags = {
        name = "ap-south1-eip"
    }
}
