# Overview
The `vpc-stack.yaml` Cloudformation template will generate a Multi-AZ Virtual Private Cloud (VPC) in AWS.  The VPC will have Internet connectivity, as well as public and private subnets.  

# Execution
1. Install the AWS CLI
2. Configure the AWS CLI to interact with the desired target account
3. Copy the `aws-vpc.template.yaml` file to an S3 Bucket.  There is a limit to the local file size that the `aws cloudformation` cli command can consume.  The limit is 10x bigger when the template source file resides in S3. Excecute the following commands.  This example assumes you're in the same directory as the template file:
```bash
aws s3 mb s3://tsj-splunk-my-bucket
aws s3 cp ./aws-vpc.template.yaml s3://tsj-splunk-my-bucket
```

```bash
aws cloudformation create-stack \
--stack-name my-vpc \
--template-url https://tsj-splunk-my-bucket.s3.amazonaws.com/aws-vpc.template.yaml \
--capabilities CAPABILITY_IAM
```