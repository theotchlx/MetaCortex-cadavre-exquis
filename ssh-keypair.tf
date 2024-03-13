# SSH keypair module

module "ssh-keypair" {
  source = "./modules/ssh-keypair"
  providers = {
    openstack = openstack
  }

  // Pass the input variables to the module
  ssh_keypair      = var.ssh_keypair
  ssh_keypair_name      = var.ssh_keypair_name
}