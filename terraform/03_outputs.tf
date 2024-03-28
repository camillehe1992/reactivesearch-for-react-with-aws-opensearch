# output "dashboard_endpoint" {
#   value = aws_opensearch_domain.this.dashboard_endpoint
# }

output "amplify_app_main_url" {
  value = "https:main.${aws_amplify_app.this.default_domain}"
}
