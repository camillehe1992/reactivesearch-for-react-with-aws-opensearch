# General Deployment Variables
environment = "prod"
nickname    = "my-awesome-search-app"

tags = {
  environment      = "prod"
  nickname         = "my-awesome-search-app"
  application_name = "My Awesome Search App"
  application_desc = "A search application powered by ReactiveSearch and OpenSearch"
  emails           = "group@example.com"
}

# Project Specific Variables
# OpenSearch
domain_name      = "movies"
instance_type    = "t3.small.search"
instance_count   = 1
local_ip_address = "124.193.176.86/32"

# Amplify
repository = "https://github.com/camillehe1992/reactivesearch-for-react-with-aws-opensearch"
