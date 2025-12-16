# COMPANY-sso-cognito-terraform

Terraform project for provisioning AWS Cognito User Pool + App Client + Cognito Domain, adding an external SAML IdP, and updating the App Client to use that SAML provider.

## Layout
- `terraform/01-user-pool`: Creates the Cognito User Pool + App Client and outputs values used elsewhere.
- `terraform/02-saml-idp`: Creates the SAML Identity Provider in the User Pool (expects SAML metadata stored in Secrets Manager).
- `terraform/03-app-client-saml`: Updates the App Client to enable the SAML provider created in step 02.

## Prereqs
- Terraform >= 1.5
- AWS credentials configured
- Permissions for Cognito + Secrets Manager

## Typical flow
```bash
cd terraform/01-user-pool && terraform init && terraform apply
cd ../02-saml-idp && terraform init && terraform apply
cd ../03-app-client-saml && terraform init && terraform apply
```

## Notes
- Do **not** commit SAML metadata or secrets into git.
- Store IdP metadata XML in AWS Secrets Manager.
- GitHub Pages site lives in `/docs` (enable in repo settings: Pages → Deploy from branch → `main` → `/docs`).
- Note the naming convention.  To make naming unique (required if you are using the aws cognito domain for withorization) pool domain name is company followed by user pool name.  all files will follow this convention to make automation easier.
- READ THE COMMENTS IN THE TERRAFORM SCRIPT!  They are there to help :)
