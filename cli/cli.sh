aws cloudformation describe-stacks --stack-name vpc-stack

aws cloudformation create-stack --stack-name ec2-instances-stack --template-url https://s3.us-west-2.amazonaws.com/cloudformation-templates-us-west-2/EC2InstanceWithSecurityGroupSample.template