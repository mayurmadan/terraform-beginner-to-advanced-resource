#this test code 
locals {
  db_password = {
    admin = "password"
  }
}

#no print this on cli and treat it as sensitive data 
output "sensitive-data" {
  value = local.db_password
  sensitive = true
}
