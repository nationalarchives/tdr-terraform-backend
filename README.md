# TDR Terraform Backend

**Important Note**: tdr-terraform-backend uses v1.5.0 of Terraform. Ensure that Terraform v1.5.0 is installed before proceeding.

## Purpose

The purpose of this repository is to setup the necessary Terraform backend AWS resources to support development operations for the TDR application in the different environments, using cross account access.

Specific resources created:
* AWS TDR Management account resources:
  * **TDR state S3 Bucket**: contains the Terraform state files for each TDR workspace
  * **TDR state DynamoDb table**: used for locking to prevent concurrent operations on a single workspace  
* AWS TDR Environment accounts resources:
  * **TDR Terraform IAM Roles**: IAM role to allow creation of AWS resources within the environment using Terraform (Terraform IAM role)
  * **IAM Policies**: Specific IAM policies to give permissions to the Terraform IAM roles

These resources are used by the TDR application Terraform code: https://github.com/nationalarchives/tdr-terraform-environments

The Terraform IAM roles are assumed by the TDR AWS Management account user running the TDR application Terraform code.

## Getting Started

### Install Terraform locally

See: https://learn.hashicorp.com/terraform/getting-started/install.html

### Add shared modules

Some of the resources created by this project depend on the shared TDR Terraform
modules.

Clone the [tdr-terraform-modules](https://github.com/nationalarchives/tdr-terraform-modules/)
project into this project's directory.

   ```
   [location of project] $ git clone git@github.com:nationalarchives/tdr-terraform-modules.git   
   ```

### Add TDR Configurations

This project depends on non-public values configured in the TDR configurations
project. Clone [tdr-configurations](https://github.com/nationalarchives/tdr-configurations)
into this project's directory.

## Running the Project

This project bootstraps management account and environments, so it needs to be
run from a development machine.

1. Clone the project to local machine: https://github.com/nationalarchives/tdr-terraform-backend

2. Add AWS credentials to the local credential store (~/.aws/credentials):

   ```
   ... other credentials ...
   [management]
   aws_access_key_id = ... management user access key ...
   aws_secret_access_key = ... management user secret key ...
   ```

  * These credentials will be used to create the Terraform backend and set up the individual Terraform environments with IAM roles that will allow Terraform to create the AWS resources in that TDR environment.
  * See instructions here: https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html

3. Run the following command to ensure Terraform uses the correct credentials and environment variables:

   ```
   [location of project] $ export AWS_PROFILE=management   
   ```
   
4. From the root of the project run Terraform in the ***default*** Terraform workspace:

   ```
   [location of project] $ terraform workspace select default   
   
   [location of project] $ terraform apply
   ```

  * This will generate:
    * IAM roles and policies in each of the TDR environments to allow Terraform to create the necessary AWS resources
    * the Terraform backend (s3 bucket and DynamoDb) which will store the Terraform state for the TDR environments in each of the TDR AWS environment accounts.

Once the Terraform Backend project has been setup the following AWS backend resources should be available in the AWS TDR Management account:

  * S3 Buckets: 
    * tdr-terraform-state;    
  * DyanmoDb Tables: 
    * tdr-terraform-state-lock;    
  * IAM Policies: 
    * TDR[env name]AccessTerraformState;    
    * TDRTerraformPolicy[env name] 
    * TDRReadTerraformState; 
    * TDRTerraformStateLockAccess
    * TDRTerraformDescribeAccount    
  * IAM Groups:    
    * TDRDEnyAccess
  * IAM Roles:    
    * TDRTerraformAssumeRole[env name] 
  
In the TDR AWS environment accounts the following AWS resources should be available in each of the AWS accounts:
  * IAM Roles: 
    * TDRTerraformRole[env name]
  
  * IAM Policies:
    * TDRFrontendTerraform[env name]-part-a
    * TDRFrontendTerraform[env name]-part-b
    * TDRKeycloakTerraform[env name]-part-a
    * TDRKeycloakTerraform[env name]-part-b    
    * *[further policies to be added as needed]*   

The IAM policies are split into parts due to a limit on the size of the policies.

## Background to TDR AWS Structure

### TDR AWS Accounts

Two TDR Application AWS accounts are used to host the different environments:
* **Integration AWS Account**: hosts the TDR *Intg* environment
* **Production AWS Account**: hosts the TDR *Staging* and *Prod* environments

In addition there is a TDR Management AWS account which is used to host the Terraform backend.

### IAM Role Delegation

IAM role delegation is used to allow users in the AWS management account to have access to the TDR environment AWS accounts to perform development operations in the TDR environments without directly accessing the TDR environments.

IAM policies are defined to create a trust relationship between the TDR environment AWS accounts (trusting account) and the management AWS account (trusted account).

Example of the IAM policy that needs to be added to the user group(s) in the AWS management account:
 
```
    {
      "Version": "2012-10-17",
      "Statement": {
        "Effect": "Allow",
        "Action": "sts:AssumeRole",
        "Resource": "arn:aws:iam::TDR-ENVIORNMENT-ID:role/[environment name]-terraform-role"
      }
    }
```

Reciprocal policies need to be defined for IAM roles in the TDR environment accounts to allow users from the management AWS account to have access to the necessary resources to perform the terraforming of the TDR environments.

The TDR Terraform script can the access the Terraform backend in the following way:

```
...
variable "workspace_iam_roles" {
  default = {
    intg    = "arn:aws:iam::INTG-ACCOUNT-ID:role/intg-terraform-role"
    staging = "arn:aws:iam::STAGING-ACCOUNT-ID:role/staging-terraform-role"
    prod    = "arn:aws:iam::PRODUCTION-ACCOUNT-ID:role/prod-terraform-role"
  }
}

terraform {
  backend "s3" {
    bucket = "[name of the bucket created in the backend Terraform]"
    key = "prototype-terraform.state"
    region = "eu-west-2"
    encrypt = true
    dynamodb_table = "[name of the DynamoDb created in the backend Terraform]"
  }
}

provider "aws" {
  region      = local.aws_region
  assume_role = var.workspace_iam_roles[terraform.workspace]
}
...

```

## Further Information

* Setting up multi-account AWS architecture with Terraform: https://www.terraform.io/docs/backends/types/s3.html#multi-account-aws-architecture
* Providing Access to an IAM User in Another AWS Account That You Own: https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_common-scenarios_aws-accounts.html
* Tutorial - Delegate Access Across AWS Accounts Using IAM Roles: https://docs.aws.amazon.com/IAM/latest/UserGuide/tutorial_cross-account-with-roles.html
