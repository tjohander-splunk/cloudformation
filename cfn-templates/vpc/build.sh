#!/bin/bash
aws cloudformation create-stack --stack-name vpc-stack --cli-input-json file://create-stack.json  --capabilities CAPABILITY_IAM