// Create an ssh keypair resource
resource "openstack_compute_keypair_v2" "ovh_keypair" {
  provider   = openstack
  name       = var.ssh_keypair_name       # Name of the SSH key to use at creation
  public_key = file(var.ssh_keypair)      # File at the path to the given ssh key
}