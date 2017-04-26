#!/bin/bash

aws cloudformation create-stack \
--stack-name pg \
--template-body file:///$(PWD)/pgdb.yml \
--parameters ParameterKey=AppServerSecurityGroupId,ParameterValue=sg-xxxx \
ParameterKey=DBAllocatedStorage,ParameterValue=10 \
ParameterKey=DBName,ParameterValue=xxxx \
ParameterKey=DBPassword,ParameterValue=xxxx \
ParameterKey=DBUser,ParameterValue=xxxx \
ParameterKey=PrivateSubnet1,ParameterValue=subnet-xxxx \
ParameterKey=PrivateSubnet2,ParameterValue=subnet-xxxx \
ParameterKey=VpcId,ParameterValue=vpc-xxxx