resource "aws_iam_policy" "sns_publish_policy" {
  name        = "SNSPublishPolicy"
  description = "Allows publishing messages to the SNS security topic"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = "sns:Publish"
        Resource = aws_sns_topic.security_alerts.arn
      }
    ]
  })
}
