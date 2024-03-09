resource "aws_iam_role" "ecs_task" {
  name = "${local.service_name}-ecs-task-role"

  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "",
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "ecs-tasks.amazonaws.com"
        },
        "Action" : "sts:AssumeRole"
      }
    ]
  })
  managed_policy_arns = [aws_iam_policy.ecs_task.arn]
  tags = {
    Name = "${local.service_name}-task-role"
  }
}

resource "aws_iam_policy" "ecs_task" {
  name = "${local.service_name}-ecs-task-policy"
  path = "/"

  policy = jsonencode({
    "Version" : "2012-10-17"
    "Statement" : [
      {
        "Action" : [
          "ssmmessages:CreateControlChannel",
          "ssmmessages:CreateDataChannel",
          "ssmmessages:OpenControlChannel",
          "ssmmessages:OpenDataChannel"
        ]
        "Effect" : "Allow"
        "Resource" : "*"
      },
    ]
  })
}
