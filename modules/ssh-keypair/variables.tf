# Provider variables

variable ovh_endpoint {
  type = string
  description = "OVH endpoint"
}

variable ovh_region {
  type = string
  description = "OVH region"
}


# Modules variables

# SSH keypair variables

variable "ssh_keypair" {
  description = "Path to the SSH keypair for the instance"
  type        = string
}

variable "ssh_keypair_name" {
  description = "Path to the SSH keypair for the instance"
  type        = string
}