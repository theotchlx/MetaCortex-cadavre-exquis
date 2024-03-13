// Create an ssh keypair resource
resource "openstack_compute_keypair_v2" "ovh_keypair" {
  provider   = openstack.ovh                  # Name of the provider declared in provider.tf
  name       = var.ssh_keypair_name           # Name of the SSH key to use at creation
  public_key = file(var.ssh_keypair)          # Path to the previously generated ssh key
}