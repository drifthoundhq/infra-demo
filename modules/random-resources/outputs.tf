output "instance_id" {
  value = random_id.instance_id.hex
}

output "resource_suffix" {
  value = random_string.suffix.result
}

output "assigned_port" {
  value = random_integer.port.result
}

output "deployment_id" {
  value = random_uuid.deployment_id.result
}
