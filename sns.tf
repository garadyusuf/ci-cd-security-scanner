provider "aws" {
  region = "eu-west-2"
}

resource "aws_sns_topic" "security_alerts" {
  name = "security-scan-alerts"
}

resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.security_alerts.arn
  protocol  = "email"
  endpoint  = "garadyusuf264@gmail.com"
}

output "sns_topic_arn" {
  value = aws_sns_topic.security_alerts.arn
}
