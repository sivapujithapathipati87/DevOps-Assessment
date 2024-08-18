resource "aws_ecs_service" "notification_service" {
  name            = "notification-service"
  cluster         = aws_ecs_cluster.cluster.id
  task_definition = aws_ecs_task_definition.notification_api.arn
  desired_count   = 2

  load_balancer {
    target_group_arn = aws_lb_target_group.notification.arn
    container_name   = "notification-api"
    container_port   = 80
  }
}

resource "aws_ecs_service" "email_service" {
  name            = "email-service"
  cluster         = aws_ecs_cluster.cluster.id
  task_definition = aws_ecs_task_definition.email_sender.arn
  desired_count   = 2

  load_balancer {
    target_group_arn = aws_lb_target_group.email.arn
    container_name   = "email-sender"
    container_port   = 80
  }
}
