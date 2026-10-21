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
  project_name    = "proj-996d8e"
  environment     = include.env.locals.environment
  instance_name   = "instance-dc4894"
  resource_prefix = "res-743ce8"
  service_name    = "svc-3de4b6"
}
