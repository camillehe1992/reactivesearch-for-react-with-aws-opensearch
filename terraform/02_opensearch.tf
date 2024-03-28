
# resource "aws_opensearch_domain" "this" {
#   domain_name    = var.domain_name
#   engine_version = var.engine_version

#   cluster_config {
#     instance_type                 = var.instance_type
#     instance_count                = var.instance_count
#     multi_az_with_standby_enabled = var.multi_az_with_standby_enabled
#   }

#   advanced_security_options {
#     enabled                        = true
#     anonymous_auth_enabled         = true
#     internal_user_database_enabled = true
#     master_user_options {
#       master_user_name     = var.master_user_name
#       master_user_password = var.master_user_password
#     }
#   }

#   domain_endpoint_options {
#     enforce_https       = true
#     tls_security_policy = "Policy-Min-TLS-1-2-2019-07"
#   }

#   encrypt_at_rest {
#     enabled = true
#   }

#   ebs_options {
#     ebs_enabled = true
#     volume_size = 10
#   }

#   node_to_node_encryption {
#     enabled = true
#   }

#   vpc_options {
#     subnet_ids = [
#       data.aws_subnet.az-1a.id
#     ]

#     security_group_ids = [aws_security_group.opensearch.id]
#   }


#   access_policies = data.aws_iam_policy_document.this.json

#   tags = merge({
#     Domain = var.domain_name
#   }, var.tags)
# }

