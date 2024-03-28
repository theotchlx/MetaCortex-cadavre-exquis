# Module outputs

// Output the SSH keypair name
output "keypair_name" {
  description = "The name of the SSH keypair"
  value = module.ssh-keypair.keypair_name
}

// Output the Register VM ID
output "register_instance_id" {
  description = "The ID of the Register VM"
  value = module.register-instance.register_instance_id
}

// Provider the Provider VM ID
output "provider_instance_id" {
  description = "The ID of the Provider VM"
  value = module.provider-instance.provider_instance_id
}

// Dispatcher the Dispatcher VM ID
output "dispatcher_instance_id" {
  description = "The ID of the Dispatcher VM"
  value = module.dispatcher-instance.dispatcher_instance_id
}