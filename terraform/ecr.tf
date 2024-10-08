resource "aws_ecr_repository" "notification_service" {
  name                 = "notification-service-repo"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
}

