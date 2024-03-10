module "my_module" {
  source = "./module" 

  region = "us-east-1" 
}

output "instance_id" {
  value = module.my_module.instance_id
}