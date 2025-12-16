#!/usr/bin/env bash
set -euo pipefail

destroy_dir() {
  local d="$1"
  echo "==> Destroying $d"
  (cd "$d" && terraform init -upgrade && terraform destroy)
}

destroy_dir "terraform/03-app-client-saml"
destroy_dir "terraform/02-saml-idp"
destroy_dir "terraform/01-user-pool"
