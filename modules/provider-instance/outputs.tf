// Output the instance ID
output "provider_instance_id" {
  description = "The ID of the Provider VM"
  value = openstack_compute_instance_v2.provider_vm.id
}

// Output the instance IP
output "instance_ip" {
  description = "The IP of the Provider VM"
  value = openstack_compute_instance_v2.provider_vm.access_ip_v4
}