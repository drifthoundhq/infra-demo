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
  project_name    = "proj-fb70e9"
  environment     = include.env.locals.environment
  instance_name   = "instance-fbdb2b"
  resource_prefix = "res-65acd7"
  service_name    = "data-pipeline-service"
}
