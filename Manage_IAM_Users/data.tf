data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "assume_role" {
  for_each = local.roles

  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = try(each.value.trusted_services, [])
    }
  }
}
