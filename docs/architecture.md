# Architecture

This repo is organized into three Terraform stacks that map cleanly to Cognito’s dependency order:

1. **User Pool + App Client** (`terraform/01-user-pool`)
   - Creates the Cognito User Pool
   - Creates a User Pool App Client
   - Outputs values needed by the IdP and App Client update steps

2. **SAML Identity Provider** (`terraform/02-saml-idp`)
   - Creates an external SAML IdP inside the User Pool
   - Reads IdP metadata XML from AWS Secrets Manager

3. **App Client SAML enablement** (`terraform/03-app-client-saml`)
   - Updates the App Client to allow the SAML IdP as an identity provider

## Why three stacks?
- Keeps blast radius small
- Makes it easy to iterate on IdP metadata and mappings without re-creating the user pool
- Matches how Cognito resources reference one another
