#!/usr/bin/env bash
set -euo pipefail

apply_dir() {
  local d="$1"
  echo "==> Applying $d"
  (cd "$d" && terraform init -upgrade && terraform apply)
}

apply_dir "terraform/01-user-pool"
apply_dir "terraform/02-saml-idp"
apply_dir "terraform/03-app-client-saml"
