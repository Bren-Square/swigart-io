#!/bin/bash

pwd
# Setup credentials
source .github/scripts/0_common.sh

# Check if repo exists in ECR
echo "Checking if ECR Repo exists"
if $(aws ecr describe-repositories --repository-names "$ECR_REPO_NAME" > /dev/null 2>&1); then
    echo "Repo already exists. No need to create it. Continuing."
else
    # Create repository
    aws ecr create-repository \
        --registry-id "$AWS_ACCOUNT" \
        --repository-name "$ECR_REPO_NAME" 
fi
