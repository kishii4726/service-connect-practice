resource "aws_security_group" "ecs_task" {
  name   = "${local.service_name}-ecs-task-sg"
  vpc_id = module.vpc.vpc_id
  tags = {
    Name = "${local.service_name}-ecs-task-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "ecs_task_ingress" {
  security_group_id            = aws_security_group.ecs_task.id
  ip_protocol                  = -1
  referenced_security_group_id = aws_security_group.ecs_task.id
}

resource "aws_vpc_security_group_egress_rule" "ecs_task_egress" {
  security_group_id = aws_security_group.ecs_task.id
  ip_protocol       = -1
  cidr_ipv4         = "0.0.0.0/0"
}
