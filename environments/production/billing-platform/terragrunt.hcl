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
  project_name    = "proj-6d4529"
  environment     = include.env.locals.environment
  instance_name   = "instance-cc08a2"
  resource_prefix = "res-2510b9"
  service_name    = "svc-d87b65"
}
