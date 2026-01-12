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
  project_name    = "proj-d06e9a"
  environment     = include.env.locals.environment
  instance_name   = "api-gw-${include.env.locals.env_suffix}"
  resource_prefix = "res-aed290"
  service_name    = "svc-7afa28"
}
