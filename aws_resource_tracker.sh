#!/bin/bash

# filepath: /path/to/aws_resource_tracker.sh

# Function to track EC2 instances
track_ec2_instances() {
    echo "Fetching EC2 instances..."
    aws ec2 describe-instances --query "Reservations[*].Instances[*].[InstanceId,State.Name,InstanceType,PublicIpAddress]" --output table
}

# Function to track S3 buckets
track_s3_buckets() {
    echo "Fetching S3 buckets..."
    aws s3api list-buckets --query "Buckets[*].Name" --output table
}

# Function to track RDS instances
track_rds_instances() {
    echo "Fetching RDS instances..."
    aws rds describe-db-instances --query "DBInstances[*].[DBInstanceIdentifier,DBInstanceClass,Engine,DBInstanceStatus]" --output table
}

# Main menu
echo "AWS Resource Tracker"
echo "1. Track EC2 Instances"
echo "2. Track S3 Buckets"
echo "3. Track RDS Instances"
echo "4. Exit"

read -p "Enter your choice: " choice

case $choice in
    1)
        track_ec2_instances
        ;;
    2)
        track_s3_buckets
        ;;
    3)
        track_rds_instances
        ;;
    4)
        echo "Exiting..."
        exit 0
        ;;
    *)
        echo "Invalid choice. Please try again."
        ;;
esac
