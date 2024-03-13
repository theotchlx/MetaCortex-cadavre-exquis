variable "register_instance_name" {
  description = "Register instance name"
  type        = string
}

variable "instance_type" {
  description = "Compute instance type"
  type        = string
  default     = "b2-7"
}