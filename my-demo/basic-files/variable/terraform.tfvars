#use same file & mentioned variable in key=value format here, this will refer before default value specify in 
#variable.tf file here , if we apply this it will choose allowed_ip from here insted of variable.tf file default value
allowed_ip = "10.101.10.102/32"
allowed_ip_runtime = "20.20.20.102/32"

