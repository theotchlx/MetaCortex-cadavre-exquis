# Module outputs

// Output the SSH keypair name
output "keypair_name" {
  description = "The name of the SSH keypair"
  value = module.ssh-keypair.keypair_name
}


# Instance IDs

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

# Instance IPs

// Output the Register VM IP
output "register_instance_ip" {
  description = "The IP of the Register VM"
  value = module.register-instance.instance_ip
}

// Provider the Provider VM IP
output "provider_instance_ip" {
  description = "The IP of the Provider VM"
  value = module.provider-instance.instance_ip
}

// Dispatcher the Dispatcher VM IP
output "dispatcher_instance_ip" {
  description = "The IP of the Dispatcher VM"
  value = module.dispatcher-instance.instance_ip
}
