output "service_name" {
  value = local.service_name
}

output "account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "vpc" {
  value = module.vpc
}
