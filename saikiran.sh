#!/bin/bash

AMI_ID="ami-0b4f379183e5706b9"         # ✅ Put your AMI ID here (e.g., Amazon Linux 2)
KEY_NAME="key-pair"           # ✅ Put your EC2 key pair name
SECURITY_GROUP="sg-062184d660bab16ba"  # ✅ Put your Security Group ID   # (optional, for VPC)

# Define service list
SERVICES=("mongodb" "shipping" "web" "payment" "user")

for SERVICE in "${SERVICES[@]}"; do
  # Choose instance type based on service name
  if [[ "$SERVICE" == "mongodb" || "$SERVICE" == "shipping" ]]; then
    INSTANCE_TYPE="t3.small"
  else
    INSTANCE_TYPE="t2.micro"
  fi

  echo "Launching $SERVICE with instance type $INSTANCE_TYPE..."

  # Create instance
  aws ec2 run-instances \
    --image-id "$AMI_ID" \
    --instance-type "$INSTANCE_TYPE" \
    --key-name "$KEY_NAME" \
    --security-group-ids "$SECURITY_GROUP" \
    --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$SERVICE}]" \
    --count 1
done


