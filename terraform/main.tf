terraform {
  required_version = ">= 0.14"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">= 4.9.0"
    }

    tls = {
      source = "hashicorp/tls"
      version = "3.4.0"
    }
  }

  cloud {
    organization = "KURATAJRX"

    workspaces {
      name = "COIN-VI"
    }
  }

}

provider "aws" {
  region = var.region
}

locals {
  tags = {
    project = "interview"
  }
}

data "aws_canonical_user_id" "current" {}

data "aws_caller_identity" "current" {}

data "aws_availability_zones" "available" {}

output "alb" {
  value = module.ecs_alb.lb_dns_name
}
