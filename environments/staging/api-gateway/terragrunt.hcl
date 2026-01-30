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
  project_name    = "api-gateway"
  environment     = include.env.locals.environment
  instance_name   = "api-gw-${include.env.locals.env_suffix}"
  resource_prefix = "res-a89bfc"
  service_name    = "svc-1fb41b"
}
