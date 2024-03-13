variable "provider_instance_name" {
  description = "Provider instance name"
  type        = string
}

variable "instance_type" {
  description = "Compute instance type"
  type        = string
  default     = "b2-7"
}