# Module outputs

// Output the SSH keypair name
output "keypair_name" {
  description = "The name of the SSH keypair"
  value = openstack_compute_keypair_v2.ovh_keypair.name
}

// Output the Register VM ID
output "register_instance_id" {
  description = "The ID of the Register VM"
  value = module.register-instance.instance_id
}

// Provider the Provider VM ID
output "provider_instance_id" {
  description = "The ID of the Provider VM"
  value = module.provider-instance.instance_id
}

// Dispatcher the Dispatcher VM ID
output "dispatcher_instance_id" {
  description = "The ID of the Dispatcher VM"
  value = module.dispatcher-instance.instance_id
}