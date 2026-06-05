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
  project_name    = "proj-0c021b"
  environment     = include.env.locals.environment
  instance_name   = "instance-cc16df"
  resource_prefix = "res-16bd2a"
  service_name    = "svc-770286"
}
