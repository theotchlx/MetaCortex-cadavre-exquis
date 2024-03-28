# Instances modules

module "register-instance" {
  source = "./modules/register-instance"

  // Pass the input variables to the module
  register_instance_name        = var.register_instance_name
  instance_type                 = var.instance_type
  ovh_endpoint                  = var.ovh_endpoint
  keypair_name                  = module.ssh-keypair.keypair_name  // Equal to var.ssh_keypair_name
}

module "provider-instance" {
  source = "./modules/provider-instance"

  // Pass the input variables to the module
  provider_instance_name        = var.provider_instance_name
  instance_type                 = var.instance_type
  ovh_endpoint                  = var.ovh_endpoint
  keypair_name                  = module.ssh-keypair.keypair_name  // Equal to var.ssh_keypair_name
}

module "dispatcher-instance" {
  source = "./modules/dispatcher-instance"

  // Pass the input variables to the module
  dispatcher_instance_name      = var.dispatcher_instance_name
  instance_type                 = var.instance_type
  ovh_endpoint                  = var.ovh_endpoint
  keypair_name                  = module.ssh-keypair.keypair_name  // Equal to var.ssh_keypair_name
}

# SSH keypair module

module "ssh-keypair" {
  source = "./modules/ssh-keypair"

  // Pass the input variables to the module
  ssh_keypair       = var.ssh_keypair
  ssh_keypair_name  = var.ssh_keypair_name
  ovh_endpoint      = var.ovh_endpoint
}