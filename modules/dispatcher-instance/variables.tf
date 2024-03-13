variable "dispatcher_instance_name" {
  description = "Dispatcher instance name"
  type        = string
}

variable "instance_type" {
  description = "Compute instance type"
  type        = string
  default     = "b2-7"
}