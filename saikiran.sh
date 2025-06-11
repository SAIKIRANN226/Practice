#!/bin/bash

AMI_ID="ami-0b4f379183e5706b9"         # ✅ Put your AMI ID here (e.g., Amazon Linux 2)        # ✅ Put your EC2 key pair name
SECURITY_GROUP="sg-062184d660bab16ba"  # ✅ Put your Security Group ID   # (optional, for VPC)

# Define service list
#!/bin/bash

# Define the list of service names used for tagging
SERVICES=("mongodb" "shipping" "web" "payment" "user")

for SERVICE in "${SERVICES[@]}"; do
  echo "Looking for instance with Name tag: $SERVICE..."

  INSTANCE_IDS=$(aws ec2 describe-instances \
    --filters "Name=tag:Name,Values=$SERVICE" "Name=instance-state-name,Values=running,pending,stopped" \
    --query "Reservations[*].Instances[*].InstanceId" \
    --output text)

  if [[ -n "$INSTANCE_IDS" ]]; then
    echo "Terminating instances for $SERVICE: $INSTANCE_IDS"
    aws ec2 terminate-instances --instance-ids $INSTANCE_IDS
  else
    echo "No instances found for $SERVICE."
  fi
done



