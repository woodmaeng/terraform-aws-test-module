## Test Module

This is a test module I've created to experiment with. It's nothing fancy, just deploys a resource or two.
The aim is to test creating a module, publishing it, and then using an environment terraform configuration to deploy the module to various environments.

This module should know nothing about the specific environments, but should understand that it can be deployed to multiple environments and it needs to cater for that through variables.


### How to build

#### Lambda source
First, the lambda source needs to be built. This consists of running `npm ci` on the nodejs source. For other languages, it could be maven or gradle.
There should be unit tests here to make sure that they pass before progressing.

The output of these builds will go into the `/terraform/lambda-output` folder. This is where the Lambda function definitions will reference. Because that folder sits underneath the `/terraform` folder, when it is packaged as a module, the compiled source will be included.

#### Terraform
The Terraform files are not intended to be built, although they can be tested to validate they work as expected. <TBD>.


### How to deploy the stand-alone application module
This module could be deployed on its own to validate that it works without issue. When dependent resources are required (e.g. S3, SNS, Dynamo, etc), they should be provisioned ahead of time. Ideally, if the module is dependent on other components like that, it is likely not at the level where it should be deployed for testing. It would appear to only be a portion of the application that should make up the module.

To deploy:
 - Log into AWS such that either the default profile has an active session, or the environment variable `AWS_PROFILE` is set with the corresponding AWS profile that has an active session.
 - Change the working directory to `/terraform`
 - run `terraform init` to ensure providers and dependent modules are downloaded
 - Create a file  `/terraform/terraform.tfvars` and populate with the following:
 ```
 environment = "<my environment name>"
 ```
 - run `terraform plan` to view the changes to be applied
 - run `terraform apply` to deploy the changes
 - run `terraform destroy` to destroy the deployed module
