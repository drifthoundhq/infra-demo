include "root" {
  path = find_in_parent_folders()
}

include "env" {
  path   = "${get_terragrunt_dir()}/../env.hcl"
  expose = true
}

include "stack" {
  path   = "${get_terragrunt_dir()}/../../../stacks/api-gateway/terragrunt.hcl"
  expose = true
}

terraform {
  source = "${get_terragrunt_dir()}/../../../modules/random-resources"
}

inputs = {
  project_name    = "proj-4ec2bc"
  environment     = include.env.locals.environment
  instance_name   = "instance-83db1b"
  resource_prefix = "res-7df5c2"
  service_name    = "svc-caf7e3"
}
