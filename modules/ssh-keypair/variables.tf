variable ovh_endpoint {
  type = string
  description = "OVH endpoint"
  default = "ovh-eu"
}

variable "ssh_keypair" {
  description = "Path to the SSH keypair for the instance"
  type        = string
}

variable "ssh_keypair_name" {
  description = "Path to the SSH keypair for the instance"
  type        = string
}