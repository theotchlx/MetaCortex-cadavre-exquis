# This xxx.tfvars defines values for the variables.
# This file is a placeholder, don't hesitate to modify it to suit your needs.

# Provider variables

tenant_name = "MetaCortex"
ovh_endpoint = "ovh-eu"
ovh_region = "WAW1"


# Modules variables

# SSH keypair module variables

ssh_private_key = "~/.ssh/id_rsa_ovh_MetaCortex"

ssh_keypair_name = "metacortex-keypair1"


# Instance modules variables

register_instance_name = "metacortex-register-vm1"
provider_instance_name = "metacortex-provider-vm1"
dispatcher_instance_name = "metacortex-dispatcher-vm1"

