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
  project_name    = "proj-b4cd63"
  environment     = include.env.locals.environment
  instance_name   = "instance-87cf49"
  resource_prefix = "res-fb8d89"
  service_name    = "auth-service"
}
