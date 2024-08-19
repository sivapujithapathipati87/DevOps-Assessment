resource "aws_appautoscaling_target" "ecs_service_scaling" {
  max_capacity       = 5
  min_capacity       = 1
  resource_id        = "service/${aws_ecs_cluster.notification_cluster.name}/${aws_ecs_service.notification_service.name}"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"
}

resource "aws_appautoscaling_policy" "cpu_scaling_policy" {
  name               = "cpu-scaling"
  service_namespace  = "ecs"
  resource_id        = aws_appautoscaling_target.ecs_service_scaling.resource_id
  scalable_dimension = aws_appautoscaling_target.ecs_service_scaling.scalable_dimension
  policy_type        = "TargetTrackingScaling"

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageCPUUtilization"
    }

    target_value = 70.0
  }
}
