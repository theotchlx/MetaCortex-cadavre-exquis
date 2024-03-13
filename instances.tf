# Instances modules

module "register-instance" {
  source = "./modules/register-instance"

  // Pass the input variables to the module
  register_instance_name      = var.register_instance_name
  instance_type               = var.instance_type
}

module "provider-instance" {
  source = "./modules/provider-instance"

  // Pass the input variables to the module
  provider_instance_name      = var.provider_instance_name
  instance_type               = var.instance_type
}

module "dispatcher-instance" {
  source = "./modules/dispatcher-instance"

  // Pass the input variables to the module
  dispatcher_instance_name      = var.dispatcher_instance_name
  instance_type                 = var.instance_type
}