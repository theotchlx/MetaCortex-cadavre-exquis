variable ovh_endpoint {
  type = string
  description = "OVH endpoint"
  default = "ovh-eu"
}

variable "dispatcher_instance_name" {
  description = "Dispatcher instance name"
  type        = string
}

variable "instance_type" {
  description = "Compute instance type"
  type        = string
  default     = "b2-7"
}

variable "keypair_name" {
  description = "SSH keypair name"
  type        = string
}