locals {
  vpc_cidr        = "10.0.0.0/16"
  public_subnets  = ["10.0.0.0/24"]
  private_subnets = ["10.0.128.0/24"]
}

data "aws_availability_zones" "available" {
  state = "available"
}


module "vpc" {
  source          = "terraform-aws-modules/vpc/aws"
  version         = "6.6.1"
  name            = local.Project_name
  azs             = data.aws_availability_zones.available.names
  cidr            = local.vpc_cidr
  public_subnets  = local.public_subnets
  private_subnets = local.private_subnets
  tags            = local.common_tags

}
