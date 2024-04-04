// Output the instance ID
output "register_instance_id" {
  description = "The ID of the Register VM"
  value = openstack_compute_instance_v2.register_vm.id
}

// Output the instance IP
output "instance_ip" {
  description = "The IP of the Register VM"
  value = openstack_compute_instance_v2.register_vm.access_ip_v4
}