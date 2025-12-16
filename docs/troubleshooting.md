# Troubleshooting

## Terraform can't find the user pool / app client
- Confirm AWS region matches where you created the pool
- Confirm the identifiers (pool id, client id) are being passed correctly

## SAML IdP creation fails due to invalid metadata
- Validate the XML is well-formed
- Ensure the IdP signing certificate is present
- Confirm the metadata includes an EntityID and SSO endpoints

## Login works but attributes are missing
- Check IdP attribute release policy
- Confirm Cognito attribute mappings in `terraform/02-saml-idp`
