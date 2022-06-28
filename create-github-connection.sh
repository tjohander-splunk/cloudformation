#!/bin/bash

CONNECTION_NAME="MyConnection"

aws codestar-connections create-connection --provider-type GitHub --connection-name ${CONNECTION_NAME}