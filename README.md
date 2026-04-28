# TDR Terraform Backend

**Important Note**: tdr-terraform-backend uses >= v1.12.1 of Terraform. Ensure that Terraform >= v1.12.1 is installed before proceeding.

## Purpose
This is the bootstrap for TDR AWS accounts and TDR environments.  It creates all the deployer roles, terraform state buckets etc.  It also configures resources used in the management account: Eventbridge, ECR etc.

## Running the Project
This stack needs to be run from a development machine.

The configuration steps providered here expect the existence of SSO roles.

1. Clone the repository

```
git clone --recurse-submodules git@github.com:nationalarchives/tdr-terraform-backend
```

2. Add AWS credentials to the local configuration file (```~/.aws/credentials```) for management and **all other TDR accounts**. The role must of course have enough permissions to deploy this stack.  E.g.

```
   ...
   [profile <PROFILE_NAME_FOR_MANAGEMENT>]
   sso_account_id  = 1234567890
   sso_role_name   = <ROLE_NAME>

   [profile <PROFILE_NAME_FOR_TDR_DEV>]
   sso_account_id  = 098765431
   sso_role_name   = <ROLE_NAME>
   ...
```

3. Edit root_provider.tf and set a corresponding profile for each provider.  Note the first provider without an alias must be the management account.  E.g.

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
