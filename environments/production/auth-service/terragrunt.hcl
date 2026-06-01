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
  project_name    = "proj-e06a2c"
  environment     = include.env.locals.environment
  instance_name   = "instance-2d9940"
  resource_prefix = "res-38fdf3"
  service_name    = "svc-b2092a"
}
