resource "aws_cloudwatch_log_group" "ecs" {
  for_each          = toset(local.applications)
  name              = "/ecs/${local.service_name}-${each.value}"
  retention_in_days = 7
}

resource "aws_cloudwatch_log_group" "service_connect" {
  for_each          = toset(local.applications)
  name              = "/ecs/service-connect-${each.value}"
  retention_in_days = 7
}
