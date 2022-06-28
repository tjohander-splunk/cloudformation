# POC-In-A-Box: Push Custom O11y Events from an AWS Codepipeline CI/CD Workflow

This project will create a connection between a Github repository and an AWS Codepipeline-based CI/CD workflow. Each stage of the pipeline will send a custom event to Splunk Observability Cloud.  These events can be overlaid on charts and dashboards to provide detailed context on application and infrastructure performance data.

The CI/CD Pipeline will build, test and deploy the Spring Pet Clinic application to a publicly accessible EC2 server.

## Fork or clone the Spring Pet Clinic application code to a Github repository you control

## Create a CodePipeline IAM Account
For the purposes of this POC, it's recommended to use an Admin user with permissions to execute almost any action on any resource.  It's certainly possible to create and user specifically for this workflow.  Details on the requirements this user will need are [here](https://docs.aws.amazon.com/codepipeline/latest/userguide/getting-started-codepipeline.html#create-iam-user)

At the very least: You must give the IAM user permissions to interact with CodePipeline. The quickest way to do this is to apply the AWSCodePipeline_FullAccess managed policy to the IAM user.



## Install AWS CLI
If you haven't setup the AWS CLI on your local machine, instructions are [here](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-set-up.html)

## Create an EC2 Server to run the deployed application
For the purposes of this POC, Spring Pet Clinic can run on a single EC2 instance   

## Create a connection between Github and AWS Codepipeline:
```bash
aws codestar-connections create-connection --provider-type GitHub --connection-name ${CONNECTION_NAME}
```
This CLI command will put a connection in "PENDING" status.  You then have to log into the web console to "approve" the connection and change it to "ACTIVE".

Further details on creating the pipeline can be found [here](https://docs.aws.amazon.com/codepipeline/latest/userguide/connections-github.html)

## Create an S3 Bucket for the source code bundle
You can store your source files or applications in any versioned location. In this tutorial, you create an S3 bucket for the sample applications and enable versioning on that bucket. After you have *enabled versioning*, you copy the sample applications to that bucket. In Bucket name, enter a name for your bucket (for example, `awscodepipeline-spring-pet-clinic-example-01042020`).
```bash
aws s3 mb <bucket details here>
```

## Complete the CodePipeline configuration file
Fill in the necessary values on the `codepipeline-config.json` file in the root of this directory.

## Complete the SAM Configuration for the Lambda function that pushes CodePipeline events to O11y Cloud.

## Execute the AWS CLI Command to build the pipeline

 
