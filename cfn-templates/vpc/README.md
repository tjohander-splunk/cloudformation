# Overview
The `vpc-stack.yaml` Cloudformation template will generate a Multi-AZ Virtual Private Cloud (VPC) in AWS.  The VPC will have Internet connectivity, as well as public and private subnets.  

# Execution
1. Install the AWS CLI
2. Configure the AWS CLI to interact with the desired target account
3. Copy the `aws-vpc.template.yaml` file to an S3 Bucket.  There is a limit to the local file size that the `aws cloudformation` cli command can consume.  The limit is 10x bigger when the template source file resides in S3.  Due to the rather large Cloudformation template file, I would recommend copying the Cloudformation template to an S3 bucket.  If you're feeling up for it, feel free to trim down the template file and reference it with switch `--template-body file://<path-to-the-local-file>` 

If you choose to upload from the AWS CLI, execute the following commands.  This example assumes you're in the same directory as the template YAML file:
```bash
aws s3 mb s3://<some-s3-bucket-name>
aws s3 cp ./aws-vpc.template.yaml s3://<some-s3-bucket-name>
```

4. Execute one either of the following commands.  The `build.sh` script references a CLI Input file.  When I define paramaters, I find this approach easier than providing them directly to the command.  If you prefer, feel free to use option 2 and pass parameter values directly to the command.  The `create-stack.json` file has a minimal configuration with my particular bucket and AZ choices.  Adapt to your needs and feel free to further customize by refencing the other parameter options in the Cloudformation template file.

Option 1:
```bash
./build.sh
```

Option 2:
```bash
aws cloudformation create-stack \
--stack-name my-vpc \
--template-url https://tsj-splunk-my-bucket.s3.amazonaws.com/aws-vpc.template.yaml \
--capabilities CAPABILITY_IAM
--parameters <define your desired stack parameters here>
```

5. It should take ~5 minutes to spin everything up.  When it's done, you should see a reference to the ARN of your hot-out-of-the-oven VPC.  If you need to get additional details of the outputs, run this command:
```bash
aws cloudformation describe-stacks --stack-name vpc-stack
```
I also find it handy to pipe that to a JSON File for reference:
```bash
aws cloudformation describe-stacks --stack-name vpc-stack > vpc-stack-details.json
```

Yay!  All done!  You know have a fully-functional VPC for study, lab and demo purposes.
