#!/bin/bash

# Title: AWS Glue Jobs & Subnet Audit Script
# Description: Lists all AWS Glue jobs and VPC subnets in given regions.

list_glue_jobs() {
  REGION=$1
  echo " Auditing Glue Jobs in region: $REGION"

  JOBS=$(aws glue list-jobs --region "$REGION" --query 'JobNames' --output text | tr '\t' '\n' | sort)
  echo "$JOBS"

  COUNT=$(echo "$JOBS" | wc -l)
  echo " Total Glue Jobs in $REGION: $COUNT"
  echo "------------------------------------------------------------"
}

list_subnets() {
  REGION=$1
  echo " Auditing Subnets in region: $REGION"

  aws ec2 describe-subnets \
    --region "$REGION" \
    --query 'Subnets[*].{Name: Tags[?Key==`Name`]|[0].Value, CIDR: CidrBlock}' \
    --output text | sort | awk '{ printf "- %s (CIDR: %s)\n", $1, $2 }'

  COUNT=$(aws ec2 describe-subnets \
    --region "$REGION" \
    --query 'length(Subnets)' \
    --output text)

  echo "Total Subnets in $REGION: $COUNT"
  echo "------------------------------------------------------------"
}

REGIONS=("us-east-1" "us-west-2")

for REGION in "${REGIONS[@]}"; do
  list_glue_jobs "$REGION"
  list_subnets "$REGION"
done
