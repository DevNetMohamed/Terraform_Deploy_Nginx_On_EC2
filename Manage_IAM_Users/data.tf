data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "assume_role" {
  for_each = local.roles

  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      # try(each.value.trusted_services, [])
      identifiers = [
        for username in keys(aws_iam_role.roles) : "arn:aws:iam::${data.aws_caller_identity.current}/${local.users}"
        
      ]
    }
  }
}
