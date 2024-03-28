# General Deployment Variables
variable "aws_region" {
  type        = string
  description = "AWS region"
}

variable "aws_profile" {
  type        = string
  default     = "default"
  description = "AWS profile which used for terraform infra deployment"
}

variable "environment" {
  type        = string
  description = "The environment of application"
}

variable "nickname" {
  type        = string
  description = "The nickname of application. Must be lowercase without special chars"
}

variable "tags" {
  type        = map(string)
  description = "The key value pairs we want to apply as tags to the resources contained in this module"
}

# Project Specific Variables

# OpenSearch
variable "domain_name" {
  type        = string
  description = "The OpenSearch domain name"
}

variable "engine_version" {
  type        = string
  description = "The engion version of OpenSearch domain"
  default     = "OpenSearch_2.11"
}

variable "instance_type" {
  type        = string
  description = "The instance type of OpenSearch doamin"
}

variable "instance_count" {
  type        = number
  description = "The number of instance in a OpenSearch doamin"
  default     = 1
}

variable "multi_az_with_standby_enabled" {
  type        = bool
  description = "Whether to enable Multi-AZ with Standby"
  default     = false
}

variable "master_user_name" {
  type        = string
  description = "The master user name"
  default     = "master"
}

# variable "master_user_password" {
#   type        = string
#   description = "The master password"
#   sensitive   = true
# }

variable "os_security_group_name" {
  type        = string
  description = "The name of Security Group for OpenSearch domain"
  default     = "opensearch-sg"
}

variable "local_ip_address" {
  type        = string
  description = "My local IP address"
}

# Amplify
variable "repository" {
  type        = string
  description = "The repository for source code"
}
variable "access_token" {
  type        = string
  description = "The personal access token for authentication"
  sensitive   = true
}
