# Root terragrunt configuration
locals {
  # Parse environment from path
  path_parts  = split("/", path_relative_to_include())
  environment = local.path_parts[1]
  stack       = local.path_parts[2]
}

# Generate provider configuration
generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

provider "random" {}
EOF
}

# Local backend (state in same directory)
remote_state {
  backend = "local"
  config = {
    path = "${get_terragrunt_dir()}/terraform.tfstate"
  }
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
}
