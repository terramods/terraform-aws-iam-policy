data "aws_iam_policy_document" "tm_custom_iam_policy" {
  count = length(var.custom_iam_policies)
  dynamic "statement" {
    for_each = var.custom_iam_policies[count.index].statements
    content {
      effect      = statement.value.effect
      actions     = statement.value.actions
      resources   = statement.value.resources
    }
  }
}