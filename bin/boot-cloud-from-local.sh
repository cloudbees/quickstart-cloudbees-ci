#!/usr/bin/env bash

#inspiration from:
#https://github.com/heptio/aws-quickstart
#https://kvz.io/blog/2013/11/21/bash-best-practices/

set -o xtrace
set -o nounset

# Where to place your cluster
REGION="${REGION:-us-east-1}"
AVAILABILITY_ZONES="${AVAILABILITY_ZONES:-us-east-1a\,us-east-1b}"

# Bucket may exist.
# Can create a bucket with something like:
# aws s3api create-bucket --bucket heptio-hello-world-idjfuiewhj --create-bucket-configuration LocationConstraint=us-west-2
S3_BUCKET="${S3_BUCKET:-quickstart-cloudbees-core}"

# Will error if the bucket doesn't exist or you don't have permission to it.
aws s3api head-bucket --bucket "${S3_BUCKET}"

# If bucket cannot be found, create it.
# use `--create-bucket-configuration LocationConstraint=$REGION --region $REGION` for regions other than us-east-1
if [ "$?" -eq 255 ]; then
  aws s3api create-bucket --bucket "${S3_BUCKET}"
fi

# Where "path/to/your/files" is the directory in S3 under which the templates and scripts directories will be placed
S3_PREFIX="${S3_PREFIX:-test-local/}"

# What you want to call your CloudFormation stack
UUID="$(uuidgen | tr -d - | tr -d '\n' | tr '[:upper:]' '[:lower:]' | cut -b 1-8)"
STACK="${STACK:-cloudbees-core-$UUID}"

# What SSH key you want to allow access to the cluster (must be created ahead of time in your AWS EC2 account)
KEYNAME="${KEYNAME:-eks-quickstart}"

# Copy the files from your local directory into your S3 bucket
aws s3 sync --acl=public-read ./templates "s3://${S3_BUCKET}/${S3_PREFIX}templates/"
aws s3 sync --acl=public-read ./submodules "s3://${S3_BUCKET}/${S3_PREFIX}submodules/"
aws s3 sync --acl=public-read ./scripts "s3://${S3_BUCKET}/${S3_PREFIX}scripts/"

#Validate the template(s)
aws cloudformation validate-template --template-url https://s3.amazonaws.com/${S3_BUCKET}/${S3_PREFIX}templates/cloudbees-core-master.yaml

 aws cloudformation create-stack \
   --region "${REGION}" \
   --stack-name "${STACK}" \
   --template-url "https://s3.amazonaws.com/${S3_BUCKET}/${S3_PREFIX}templates/cloudbees-core-master.yaml" \
   --parameters \
     ParameterKey=KeyPairName,ParameterValue="${KEYNAME}" \
     ParameterKey=QSS3BucketName,ParameterValue="${S3_BUCKET}" \
     ParameterKey=QSS3KeyPrefix,ParameterValue="${S3_PREFIX}" \
     ParameterKey=AvailabilityZones,ParameterValue="${AVAILABILITY_ZONES}"
#     ParameterKey=AdminIngressLocation,ParameterValue="${INGRESS}" \
#   --capabilities=CAPABILITY_IAM
#   --disable-rollback