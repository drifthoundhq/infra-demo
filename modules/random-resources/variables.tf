variable "project_name" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "instance_name" {
  description = "Instance name"
  type        = string
}

variable "resource_prefix" {
  description = "Resource prefix"
  type        = string
}

variable "service_name" {
  description = "Service name"
  type        = string
}

variable "port_min" {
  description = "Minimum port"
  type        = number
  default     = 8000
}

variable "port_max" {
  description = "Maximum port"
  type        = number
  default     = 9000
}
