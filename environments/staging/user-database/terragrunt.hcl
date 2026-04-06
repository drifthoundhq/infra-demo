include "root" {
  path = find_in_parent_folders()
}

include "env" {
  path   = "${get_terragrunt_dir()}/../env.hcl"
  expose = true
}

include "stack" {
  path   = "${get_terragrunt_dir()}/../../../stacks/user-database/terragrunt.hcl"
  expose = true
}

terraform {
  source = "${get_terragrunt_dir()}/../../../modules/random-resources"
}

inputs = {
  project_name    = "proj-449a90"
  environment     = include.env.locals.environment
  instance_name   = "userdb-${include.env.locals.env_suffix}"
  resource_prefix = "res-b3ddfa"
  service_name    = "svc-43dfe9"
}
