resource "aws_iam_role" "roles" {
  for_each = local.roles

  name               = each.key
  description        = try(each.value.description, null)
  assume_role_policy = data.aws_iam_policy_document.assume_role[each.key].json
  tags               = var.tags
}
