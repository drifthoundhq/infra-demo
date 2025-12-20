resource "random_id" "instance_id" {
  byte_length = 8
  keepers = {
    name = var.instance_name
  }
}

resource "random_string" "suffix" {
  length  = 8
  special = false
  keepers = {
    prefix = var.resource_prefix
  }
}

resource "random_integer" "port" {
  min = var.port_min
  max = var.port_max
  keepers = {
    service = var.service_name
  }
}

resource "random_uuid" "deployment_id" {
  keepers = {
    project     = var.project_name
    environment = var.environment
  }
}
