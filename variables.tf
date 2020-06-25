variable "aws_region" {
  type = string
  default = ""
}

variable "aws_profile" {
  type = string
}

# 

variable "owner" {
  type = string
  default = ""
}

variable "project" {
  type = string
  default = ""
}

variable "product" {
  type = string
  default = ""
}

variable "environment" {
  type = string
  default = ""
}

# MODULE related variables

variable "name_forced" {
  type = string
  default = ""
}

variable "name_suffix" {
  type = string
  default = ""
}

variable "custom_iam_policies" {
  type = list
  default = []
}