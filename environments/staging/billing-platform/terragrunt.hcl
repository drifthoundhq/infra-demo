include "root" {
  path = find_in_parent_folders()
}

include "env" {
  path   = "${get_terragrunt_dir()}/../env.hcl"
  expose = true
}

include "stack" {
  path   = "${get_terragrunt_dir()}/../../../stacks/billing-platform/terragrunt.hcl"
  expose = true
}

terraform {
  source = "${get_terragrunt_dir()}/../../../modules/random-resources"
}

inputs = {
  project_name    = "proj-1f5e60"
  environment     = include.env.locals.environment
  instance_name   = "instance-efd081"
  resource_prefix = "billing"
  service_name    = "svc-33d125"
}
