// Output the SSH keypair name
output "keypair_name" {
  description = "The name of the SSH keypair"
  value = openstack_compute_keypair_v2.ovh_keypair.name
}