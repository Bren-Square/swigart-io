#!/bin/bash

# Setup credentials
source .github/scripts/0_common.sh
echo "Full Reference Tag: $BRANCH_NAME:$GITHASH"

# Build
docker build -t "$GITHASH" . || exit 1

# Login to EC
aws ecr get-login-password \
    --region "$AWS_REGION" \
    | docker login \
    --username AWS \
    --password-stdin "$ECR_URL"


# Tag build for ECR
docker tag "$GITHASH" "$ECR_URI:$GITHASH"

# Push to ECR
docker push "$ECR_URI:$GITHASH" || exit 1
