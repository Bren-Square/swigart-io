locals {
  app_name = "swigart-io"

  tags = {
    Name        = local.tier
    Owner       = "bts"
    Department  = "eds"
    GitRepo     = "swigart-io"
    ProjectName = local.app_name
    Tier        = local.tier
  }

  public_subnet_tags = {
    Name        = local.tier
    Owner       = "bts"
    Department  = "eds"
    GitRepo     = "swigart-io"
    ProjectName = local.app_name
    Tier        = local.tier
    Status      = "public"
  }

  private_subnet_tags = {
    Name        = local.tier
    Owner       = "bts"
    Department  = "eds"
    GitRepo     = "swigart-io"
    ProjectName = local.app_name
    Tier        = local.tier
    Status      = "private"
  }
  tier = terraform.workspace
}

variable "container_version" {
  type = string
}

variable "aws_region" {
  default = "us-east-1"
}

variable "aws_profile" {
  default = "default"
}
