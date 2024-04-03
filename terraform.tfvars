# This xxx.tfvars defines values for the variables.

# Provider variables

tenant_name = "MetaCortex"
ovh_endpoint = "ovh-eu"
ovh_region = "WAW1"


# Modules variables

# SSH keypair module variables

ssh_keypair = "~/.ssh/id_rsa_ovh_MetaCortex.pub"

ssh_keypair_name = "metacortex-keypair"


# Instance modules variables

register_instance_name = "metacortex-register-vm"
provider_instance_name = "metacortex-provider-vm"
dispatcher_instance_name = "metacortex-dispatcher-vm"

