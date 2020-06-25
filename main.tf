provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
  version = "~> 2.35"
}

terraform {
  required_version = ">= 0.12.20"
  backend "s3" {}
}

locals {
  base_name = "${lower(var.owner)}-${lower(var.project)}${var.product != "" ? format("-%s", lower(var.product)) : ""}-${lower(var.environment)}"
  base_tags = {
    Deployer = "Terraform"
    Owner = title(var.owner)
    Project = title(var.project)
  }
}

resource "aws_iam_policy" "tm_custom_iam_policy" {
  count   = length(var.custom_iam_policies)
  name    = "${var.name_forced != "" ? var.name_forced : "${local.base_name}${var.name_suffix != "" ? format("-%s", var.name_suffix) : ""}"}-${var.custom_iam_policies[count.index].aws_resource}-policy"
  policy  = data.aws_iam_policy_document.tm_custom_iam_policy[count.index].json
}