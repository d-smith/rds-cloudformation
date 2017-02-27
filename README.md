# RDS Cloud Formation Template

Cloud Formation template for instantiating a multi-az oracle instance.

This stack assumes a VPC has been created via the vpc-pub-priv.yaml
template in [this](https://github.com/d-smith/ecs-sample) project.

## Installing a Schema

To install a schema or do other database maintenance work, you
need to boot a bastion host in one of the public subnets with
the DBMaintSecurityGroup security group created by this stack.

Probably the easiest way to have the tools on hand for database
work is to have a docker container you can use. This keeps the install
and configuration of the db maintenance instance simple.

For example, to run dockerized flyway, boot an instance with the 
following user data:

<pre>
#!/bin/bash
yum update -y
yum install -y docker
yum install -y git 
service docker start
</pre>

Now you can clone your project that uses flyway for schema management,
update the flyway config as appropriate, then 
`sudo docker run -v $PWD:/fwmnt xtracdev/flyway:4.0.3`

