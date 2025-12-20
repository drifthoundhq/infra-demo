#!/bin/bash
# Run DriftHound checks on all environments locally
#
# Usage:
#   DRIFTHOUND_TOKEN=your-token ./scripts/run-all-checks.sh
#
# Environment variables:
#   DRIFTHOUND_TOKEN    - Required: API token for DriftHound
#   DRIFTHOUND_API_URL  - Optional: API URL (default: http://localhost:3000)

set -e

API_URL="${DRIFTHOUND_API_URL:-http://localhost:3000}"
TOKEN="${DRIFTHOUND_TOKEN}"

if [ -z "$TOKEN" ]; then
  echo "Error: DRIFTHOUND_TOKEN environment variable required"
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ROOT_DIR="$SCRIPT_DIR/.."

echo "Running DriftHound checks..."
echo "API URL: $API_URL"
echo ""

# Define all environments to check
declare -a ENVIRONMENTS=(
  "production:api-gateway"
  "production:auth-service"
  "production:billing-platform"
  "production:data-pipeline"
  "production:user-database"
  "staging:api-gateway"
  "staging:billing-platform"
  "staging:user-database"
  "development:user-database"
)

for env_stack in "${ENVIRONMENTS[@]}"; do
  IFS=':' read -r environment stack <<< "$env_stack"

  dir="$ROOT_DIR/environments/$environment/$stack"

  if [ -d "$dir" ]; then
    echo "Checking $stack / $environment..."

    drifthound --tool=terragrunt \
      --project="$stack" \
      --environment="$environment" \
      --token="$TOKEN" \
      --api-url="$API_URL" \
      --dir="$dir"

    echo ""
  else
    echo "Warning: Directory not found: $dir"
  fi
done

echo "Done!"
