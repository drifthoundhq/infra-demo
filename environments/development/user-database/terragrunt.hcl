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
  project_name    = "user-database"
  environment     = include.env.locals.environment
  instance_name   = "instance-b89059"
  resource_prefix = "res-c1bcc7"
  service_name    = "svc-fcd644"
}
