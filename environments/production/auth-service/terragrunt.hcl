include "root" {
  path = find_in_parent_folders()
}

include "env" {
  path   = "${get_terragrunt_dir()}/../env.hcl"
  expose = true
}

include "stack" {
  path   = "${get_terragrunt_dir()}/../../../stacks/auth-service/terragrunt.hcl"
  expose = true
}

terraform {
  source = "${get_terragrunt_dir()}/../../../modules/random-resources"
}

inputs = {
  project_name    = "auth-service"
  environment     = include.env.locals.environment
  instance_name   = "auth-${include.env.locals.env_suffix}"
  resource_prefix = "auth"
  service_name    = "auth-service"
}
