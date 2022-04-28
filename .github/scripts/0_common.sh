#!/bin/bash

# Select Environment
# CRED_JSON=$(aws sts assume-role \
#    --role-arn "arn:aws:iam::$AWS_ACCOUNT:role/build-agent" \
#   --role-session-name $ENVIRONMENT-$EDS_APP)

# Overwrite session credentials
#AWS_ACCESS_KEY_ID=$(echo "$CRED_JSON" | jq -r '.Credentials.AccessKeyId')
export AWS_ACCESS_KEY_ID
#AWS_SECRET_ACCESS_KEY=$(echo "$CRED_JSON" | jq -r '.Credentials.SecretAccessKey')
export AWS_SECRET_ACCESS_KEY
#AWS_SESSION_TOKEN=$(echo "$CRED_JSON" | jq -r '.Credentials.SessionToken')
#export AWS_SESSION_TOKEN

# Get last 5 digits of the SHA and append epoch to it.
GITHASH="${GITHUB_SHA: -5}"
export GITHASH

# Get Repo name
REPO_NAME=$(echo "$GITHUB_REPOSITORY" | awk -F '/' '{print $2}')
export REPO_NAME

# Get Branch name
BRANCH_NAME=$(echo "$GITHUB_REF" | awk -F '/' '{print $3}')
export BRANCH_NAME

# Construct repo name
ECR_REPO_NAME="$ENVIRONMENT-$REPO_NAME"
export ECR_REPO_NAME
ECR_URI="$AWS_ACCOUNT.dkr.ecr.$AWS_REGION.amazonaws.com/$ECR_REPO_NAME"
export ECR_URI
ECR_URL="$AWS_ACCOUNT.dkr.ecr.$AWS_REGION.amazonaws.com"
export ECR_URL

# Setup profile
aws configure set region us-east-1 --profile default
aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID --profile default
aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY --profile default
aws configure set output json --profile default