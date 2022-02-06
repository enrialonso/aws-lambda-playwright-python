#!/bin/bash
set -a
. $(pwd)/env/${1}.env
set +a

ECR_REPO_NAME="serverless-aws-lambda-playwright-${STAGE}"

IMAGES_TO_DELETE=$(aws ecr list-images --region ${AWS_REGION} --repository-name ${ECR_REPO_NAME} --filter "tagStatus=UNTAGGED" --query 'imageIds[*]' --output json)
aws ecr batch-delete-image --region ${AWS_REGION} --repository-name ${ECR_REPO_NAME} --image-ids "${IMAGES_TO_DELETE}" || true