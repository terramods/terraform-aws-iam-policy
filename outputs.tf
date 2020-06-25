output "arn" {
  value = aws_iam_policy.tm_custom_iam_policy[*].arn
}