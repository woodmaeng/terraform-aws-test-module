#!/bin/bash

# filepath: /C:/OnlyOnMyPC/repos/terraform-aws-test-module/build.sh

# Navigate to the directory containing the Lambda function source code
cd hello-world

# Install dependencies
npm ci

# If output directory does not exist, create it
mkdir -p ../../terraform/lambda-output

# Create the zip file
zip -r ../../terraform/lambda-output/hello_world.zip .
