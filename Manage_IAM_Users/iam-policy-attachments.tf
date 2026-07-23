resource "aws_iam_role_policy_attachment" "role_managed_policies" {
  for_each = local.role_policy_map

  role       = aws_iam_role.roles[each.value.role_key].name
  policy_arn = each.value.arn
}

resource "aws_iam_user_policy_attachment" "user_managed_policies" {
  for_each = local.user_policy_map

  user       = aws_iam_user.users[each.value.user_key].name
  policy_arn = each.value.arn
}

data "aws_iam_policy_document" "user_assume_role" {
  for_each = local.users

  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    resources = [
      for role_key in each.value.roles : aws_iam_role.roles[role_key].arn
    ]
  }
}

resource "aws_iam_user_policy" "user_assume_role" {
  for_each = local.users

  name   = "${each.value.name}-assume-role"
  user   = aws_iam_user.users[each.key].name
  policy = data.aws_iam_policy_document.user_assume_role[each.key].json
}
