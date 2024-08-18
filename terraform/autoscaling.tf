resource "aws_appautoscaling_target" "notification_service_scaling" {
  service_namespace = "ecs"
  resource_id       = "service/${aws_ecs_cluster.cluster.name}/${aws_ecs_service.notification_service.name}"
  scalable_dimension = "ecs:service:DesiredCount"
  min_capacity      = 2
  max_capacity      = 10
}

resource "aws_appautoscaling_policy" "notification_scaling_policy" {
  name = "cpu-scaling"

  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.notification_service_scaling.resource_id
  scalable_dimension = aws_appautoscaling_target.notification_service_scaling.scalable_dimension
  service_namespace  = aws_appautoscaling_target.notification_service_scaling.service_namespace

  target_tracking_scaling_policy_configuration {
    target_value       = 70.0
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageCPUUtilization"
    }
  }
}
