# DriftHound Infrastructure Demo

A demo repository showcasing [DriftHound](https://github.com/treezio/DriftHound) infrastructure drift detection with Terragrunt.

This repository uses Terraform's `random` provider to simulate infrastructure without requiring any cloud accounts.

Demo live site: https://demo.drifthound.io

> [!NOTE]
> DriftHound demo repository in hosted in [Render](https://render.com/) under free tier subscription. It might take some minutes to boot up as it automatically spins down after inactivity period.

## Repository Structure

```
├── drifthound.yaml              # DriftHound Action configuration
├── terragrunt.hcl               # Root Terragrunt config
├── modules/
│   └── random-resources/        # Shared Terraform module
├── stacks/                      # Stack definitions
│   ├── api-gateway/
│   ├── auth-service/
│   ├── billing-platform/
│   ├── data-pipeline/
│   └── user-database/
└── environments/                # Environment deployments
    ├── production/
    ├── staging/
    └── development/
```

## Projects & Environments

| Project | Production | Staging | Development |
|---------|:----------:|:-------:|:-----------:|
| api-gateway | ✓ | ✓ | - |
| auth-service | ✓ | - | - |
| billing-platform | ✓ | ✓ | - |
| data-pipeline | ✓ | - | - |
| user-database | ✓ | ✓ | ✓ |

**Total**: 5 projects, 9 environments

## Quick Start

### Prerequisites

- [opentofu](https://opentofu.org/docs/v1.11/intro/install/) >= 1.11.2
- [Terragrunt](https://terragrunt.gruntwork.io/docs/getting-started/install/) >= 0.96.0

### Initialize All Environments

```bash
# Initialize all environments at once
cd environments
terragrunt run-all init

# Or initialize a specific environment
cd environments/production/api-gateway
terragrunt init
```

### Apply Infrastructure

```bash
# Apply all environments
cd environments
terragrunt run-all apply --terragrunt-non-interactive

# Or apply a specific environment
cd environments/production/api-gateway
terragrunt apply
```

## Running Drift Checks

### Using GitHub Actions

1. Fork this repository
2. Configure repository secrets:
   - `DRIFTHOUND_URL` - Your DriftHound instance URL
   - `DRIFTHOUND_TOKEN` - API token from DriftHound
3. Run the "Infrastructure Drift Detection" workflow manually or enable the schedule

### Running Locally

```bash
# Set your DriftHound credentials
export DRIFTHOUND_TOKEN=your-api-token
export DRIFTHOUND_API_URL=https://your-drifthound.example.com

# Run checks on all environments
./scripts/run-all-checks.sh
```

## Creating Drift (For Demo)

To simulate drift, modify the `inputs` in any environment's `terragrunt.hcl` file without applying:

```hcl
# In environments/production/billing-platform/terragrunt.hcl
# Change:
instance_name = "billing-prod"
# To:
instance_name = "billing-prod-v2"
```

Then run a drift check - it will detect the change as drift.

## Configuration

### drifthound.yaml

The `drifthound.yaml` file defines all scopes for the DriftHound GitHub Action:

```yaml
default_tool: terragrunt

scopes:
  - name: "api-gateway-prod"
    project: "api-gateway"
    environment: "production"
    directory: "./environments/production/api-gateway"
  # ... more scopes
```

### GitHub Secrets Required

| Secret | Description |
|--------|-------------|
| `DRIFTHOUND_URL` | DriftHound API URL (e.g., `https://drifthound.example.com`) |
| `DRIFTHOUND_TOKEN` | API token created in DriftHound web UI |

## License

MIT
