resource "aws_secretsmanager_secret" "notification_service_secret" {
  name        = "notification-service-secret"
  description = "Secret for Notification Service"
}

resource "aws_secretsmanager_secret_version" "secret_value" {
  secret_id     = aws_secretsmanager_secret.notification_service_secret.id
  secret_string = jsonencode({
    SECRET_KEY = "your-secret-key-value"
  })
}
