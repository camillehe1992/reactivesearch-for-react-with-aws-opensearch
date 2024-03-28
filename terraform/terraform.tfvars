# General Deployment Variables
environment = "prod"
nickname    = "demo-opensearch"

tags = {
  environment      = "prod"
  nickname         = "demo-opensearch"
  application_name = "Demo OpenSearch Application"
  application_desc = "A sample for creating a search application with Amazon OpenSearch Service"
  emails           = "group@example.com"
}

# Project Specific Variables
# OpenSearch
domain_name      = "movies"
instance_type    = "t3.small.search"
instance_count   = 1
local_ip_address = "124.193.176.86/32"

# Amplify
repository = "https://github.com/camillehe1992/aws-terraform-examples"
