#!/usr/bin/env bash
set -euo pipefail

echo "Terraform version:"
terraform version

echo ""
echo "AWS identity:"
aws sts get-caller-identity
