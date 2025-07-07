#!/bin/bash

echo "AWS Resource Tracker"
echo "====================="

# Function to list EC2 instances
list_ec2_instances() {
    echo "EC2 Instances:"
    aws ec2 describe-instances --query "Reservations[*].Instances[*].[InstanceId,State.Name]" --output table
    echo ""
}

# Function to list S3 buckets
list_s3_buckets() {
    echo "S3 Buckets:"
    aws s3api list-buckets --query "Buckets[*].[Name,CreationDate]" --output table
    echo ""
}

# Function to list CloudWatch alarms
list_cloudwatch_alarms() {
    echo "CloudWatch Alarms:"
    aws cloudwatch describe-alarms --query "MetricAlarms[*].[AlarmName,StateValue]" --output table
    echo ""
}

# Main function
main() {
    list_ec2_instances
    list_s3_buckets
    list_cloudwatch_alarms
}

# Execute the main function
main
