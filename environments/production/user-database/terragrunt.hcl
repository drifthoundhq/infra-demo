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
  project_name    = "proj-95d1ed"
  environment     = include.env.locals.environment
  instance_name   = "instance-287aba"
  resource_prefix = "userdb"
  service_name    = "svc-fe29dd"
}
