include "root" {
  path = find_in_parent_folders()
}

include "env" {
  path   = "${get_terragrunt_dir()}/../env.hcl"
  expose = true
}

include "stack" {
  path   = "${get_terragrunt_dir()}/../../../stacks/data-pipeline/terragrunt.hcl"
  expose = true
}

terraform {
  source = "${get_terragrunt_dir()}/../../../modules/random-resources"
}

inputs = {
  project_name    = "proj-ec185f"
  environment     = include.env.locals.environment
  instance_name   = "instance-3a33e7"
  resource_prefix = "res-2884af"
  service_name    = "svc-3b510e"
}
