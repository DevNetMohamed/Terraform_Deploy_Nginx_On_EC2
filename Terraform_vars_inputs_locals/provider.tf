terraform {
  required_version = "< 5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "<5.0"

    }
    random = {
      source  = "hashicorp/random"
      version = "< 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
  alias  = "us-east-1"
}

resource "random_id" "random_siffex" {
  byte_length = 6
}