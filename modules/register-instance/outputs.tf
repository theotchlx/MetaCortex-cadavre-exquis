// Output the instance ID
output "register_instance_id" {
  description = "The ID of the Register VM"
  value = openstack_compute_instance_v2.register_vm.id
}