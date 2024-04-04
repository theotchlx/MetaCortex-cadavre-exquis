// Output the instance ID
output "dispatcher_instance_id" {
  description = "The ID of the Dispatcher VM"
  value = openstack_compute_instance_v2.dispatcher_vm.id
}

// Output the instance IP
output "instance_ip" {
  description = "The IP of the Dispatcher VM"
  value = openstack_compute_instance_v2.dispatcher_vm.access_ip_v4
}