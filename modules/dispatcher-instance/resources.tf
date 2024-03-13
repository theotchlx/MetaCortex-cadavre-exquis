// Create an instance
resource "openstack_compute_instance_v2" "dispatcher_vm" {
  name        = var.dispatcher_instance_name  # Instance name
  provider    = openstack.ovh               # Provider name
  image_name  = "Debian 12"                 # Image name
  flavor_name = var.instance_type           # Instance type

  // "ovh_keypair" openstack_compute_keypair_v2 Terraform resource
  key_pair    = module.ssh-keypair.keypair_name
  network {
    name      = "Ext-Net"  # Network resource to to reach the instance
  }
}