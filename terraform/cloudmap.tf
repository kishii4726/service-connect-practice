resource "aws_service_discovery_http_namespace" "service_connect" {
  name = "${local.service_name}-namespace"
}
