// Output the instance ID
output "dispatcher_instance_id" {
  description = "The ID of the Dispatcher VM"
  value = openstack_compute_instance_v2.dispatcher_vm.id
}