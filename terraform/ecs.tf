resource "aws_ecs_cluster" "service_connect" {
  name = "${local.service_name}-cluster"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }

  # service_connect_defaults
}
