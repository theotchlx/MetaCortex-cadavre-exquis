# Resources

// Create an instance resource
resource "openstack_compute_instance_v2" "register_vm" {
  name        = var.register_instance_name  # Instance name
  provider    = openstack.ovh               # Provider name
  image_name  = "Debian 12"                 # Image name
  flavor_name = var.instance_type           # Instance type

  // "ovh_keypair" openstack_compute_keypair_v2 Terraform resource
  key_pair    = "MetaCortex"                # Key pair name
  network {
    name      = "Ext-Net"  # Network resource to to reach the instance
  }
}

// Create an ssh keypair resource
resource "openstack_compute_keypair_v2" "ovh_keypair" {
  provider   = openstack.ovh                  # Name of the provider declared in provider.tf
  name       = "metacortex_keypair"           # Name of the SSH key to use at creation
  public_key = file(var.ssh_keypair)          # Path to the previously generated ssh key
}