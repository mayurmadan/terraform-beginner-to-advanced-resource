#what ever try to attached to modules(here ec2) that should be available in child module confuguration 
module "proejctA-ec2-module" {
    #here ../.. used to go -> projectA/projects folder inside this ec2 resource referance
    source = "../../modules/ec2"
 #here we use ec2_type instead of instance_type, it work fine because we specify the same varibale (ec2_type)
  #for instance_type in module, it will use t2.nano instead of value define in module
    ec2_type = "t2.nano" 
    #here security_group_id is the argument we pass as a varibale in child module configuration
    #fomrat is module.<module-name>.<output-name>
    security_group_id = module.ec2_sg.sg_name
}

#to print o/p in cli 
output "sg_id" {
  value = module.ec2_sg.sg_name
}
