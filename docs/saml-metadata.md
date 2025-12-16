# SAML Metadata

The SAML Identity Provider (IdP) typically publishes an **IdP metadata XML** document.
This repo assumes you store that XML in **AWS Secrets Manager** and reference the secret
from `terraform/02-saml-idp`.

## Recommended approach
- Create a secret named something like: `company/cognito/saml/idp-metadata`
- Set the secret value to the raw XML

## Example secret creation (AWS CLI)
```bash
aws secretsmanager create-secret \
  --name "company/cognito/saml/idp-metadata" \
  --secret-string file://idp-metadata.xml
```

> Do not commit metadata XML to git. Treat it as configuration owned by your IdP team.
