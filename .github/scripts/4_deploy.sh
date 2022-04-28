#!/bin/bash

# Setup credentials
source .github/scripts/0_common.sh

# set TF container hash
export TF_VAR_container_version="$GITHASH"

# Navigate to prov dir
cd .tf

# Init 
export TF_KEY='provision'
../.github/utils/tf-init -w

# Select Workspace
terraform workspace select "$ENVIRONMENT"

# Apply all the things!
terraform apply -auto-approve
