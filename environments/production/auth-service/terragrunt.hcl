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
  project_name    = "proj-84bc0f"
  environment     = include.env.locals.environment
  instance_name   = "instance-3414fa"
  resource_prefix = "res-0d35fc"
  service_name    = "svc-c3de28"
}
