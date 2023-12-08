variable "ec2_type" {
  default = "t2.micro"
}
variable "security_group_id" {
  description = "getting value for this using sg module"
  default = []
}
