# Provider variables

variable tenant_name {
  type = string
  description = "Name of the tenant"
  default = "MetaCortex"
}

variable ovh_endpoint {
  type = string
  description = "OVH endpoint"
  default = "ovh-eu"
}

variable ovh_region {
  type = string
  description = "OVH region"
  default = "WAW1"
}


# Modules variables

# SSH keypair variables

variable "ssh_keypair" {
  description = "Path to the SSH keypair for the instance"
  type        = string
  default     = "~/.ssh/id_rsa_ovh.pub"
}

variable "ssh_keypair_name" {
  description = "Path to the SSH keypair for the instance"
  type        = string
  default     = "metacortex-keypair"
}

# Instance modules variables

variable "register_instance_name" {
  description = "Register instance name"
  type        = string
  default     = "metacortex-register-vm"
}

variable "provider_instance_name" {
  description = "Provider instance name"
  type        = string
  default     = "metacortex-provider-vm"
}

variable "dispatcher_instance_name" {
  description = "Dispatcher instance name"
  type        = string
  default     = "metacortex-dispatcher-vm"
}

variable "instance_type" {
  description = "Compute instance type"
  type        = string
  default     = "b2-7"
}
