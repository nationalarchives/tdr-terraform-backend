# TDR Terraform Backend

**Important Note**: tdr-terraform-backend uses >= v1.12.1 of Terraform. Ensure that Terraform >= v1.12.1 is installed before proceeding.

## Purpose
This is the bootstrap for TDR AWS accounts and TDR environments.  It creates all the deployer roles, terraform state buckets etc.  It also configures resources used in the management account, Eventbridge etc.

## Running the Project
This project bootstraps the management account and environments, so it needs to be run from a development machine.

Because this is a bootstrap stack it does not rely on pre-existing IAM Roles for deployment.  The configuration steps provider here expect the existence of SSO roles.

1. Clone the project to local machine

```
git clone --recurse-submodules git@github.com:nationalarchives/tdr-terraform-backend
```

2. Add AWS credentials to the local configuration file (~/.aws/credentials) for management and **all other TDR accounts**. E.g.  The role must of course have enough permissions to deploy this stack.

   ```
   ... other credentials ...
   [<PROFILE_NAME_FOR_MANAGEMENT>]
   sso_account_id  = ... management account number  ...
   sso_role_name  = ... management role ...

   [<PROFILE_NAME_FOR_TDR_DEV>]
   sso_account_id  = ... dev account number  ...
   sso_role_name  = ... dev role ...
   ...
   ```

3. Edit root_provider.tf and set a corresponding profile for each provider.  Note that top one without an alias must be the management account.  E.g.

```hcl
provider "aws" {
  region  = "eu-west-2"
  profile = "<PROFILE_NAME_FOR_MANAGEMENT>"
}

provider "aws" {
  alias   = "dev"
  region  = "eu-west-2"
  profile = "<PROFILE_NAME_FOR_TDR_DEV>"
}
```
   
4. From the root of the project run Terraform in the ***default*** Terraform workspace:

   ```
   [location of project] $ terraform workspace select default   
   
   [location of project] $ terraform apply
   ```