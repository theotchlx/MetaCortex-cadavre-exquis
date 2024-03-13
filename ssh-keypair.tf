# SSH keypair module

module "ssh-keypair" {
  providers = {
    openstack.ovh = openstack.ovh
  }
  source = "./modules/ssh-keypair"

  // Pass the input variables to the module
  ssh_keypair      = var.ssh_keypair
  ssh_keypair_name      = var.ssh_keypair_name
}