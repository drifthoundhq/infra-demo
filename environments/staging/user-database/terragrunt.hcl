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
  project_name    = "proj-bf8e8d"
  environment     = include.env.locals.environment
  instance_name   = "instance-3157f3"
  resource_prefix = "res-8aa864"
  service_name    = "svc-500a1a"
}
