# Auto-generated by fogg. Do not edit
# Make improvements in fogg, so that everyone can benefit.
provider "aws" {

  region  = "ap-southeast-1"
  profile = "default"

  allowed_account_ids = ["561970534831"]
}
# Aliased Providers (for doing things in every region).

terraform {
  required_version = "=1.0.0"

  backend "s3" {

    bucket         = "lisadaly"
    dynamodb_table = "lisadaly"
    key            = "terraform/lisadaly/envs/staging/components/dbproxy.tfstate"
    encrypt        = true
    region         = "ap-southeast-1"
    profile        = "default"


  }
  required_providers {

    archive = {
      source = "hashicorp/archive"

      version = "~> 2.0"

    }

    assert = {
      source = "bwoznicki/assert"

      version = "~> 0.0.1"

    }

    aws = {
      source = "hashicorp/aws"

      version = "2.47.0"

    }

    local = {
      source = "hashicorp/local"

      version = "~> 2.0"

    }

    null = {
      source = "hashicorp/null"

      version = "~> 3.0"

    }

    random = {
      source = "hashicorp/random"

      version = "~> 2.2"

    }

    template = {
      source = "hashicorp/template"

      version = "~> 2.2"

    }

    tls = {
      source = "hashicorp/tls"

      version = "~> 3.0"

    }

  }
}
variable "env" {
  type    = string
  default = "staging"
}
variable "project" {
  type    = string
  default = "lisadaly"
}
variable "region" {
  type    = string
  default = "ap-southeast-1"
}
variable "component" {
  type    = string
  default = "dbproxy"
}
variable "aws_profile" {
  type    = string
  default = "default"
}
variable "owner" {
  type    = string
  default = "raymond@philippinedev.com"
}
variable "tags" {
  type = object({ project : string, env : string, service : string, owner : string, managedBy : string })
  default = {
    project   = "lisadaly"
    env       = "staging"
    service   = "dbproxy"
    owner     = "raymond@philippinedev.com"
    managedBy = "terraform"
  }
}
data "terraform_remote_state" "global" {
  backend = "s3"
  config = {


    bucket         = "lisadaly"
    dynamodb_table = "lisadaly"
    key            = "terraform/lisadaly/global.tfstate"
    region         = "ap-southeast-1"
    profile        = "default"


  }
}
data "terraform_remote_state" "bastion" {
  backend = "s3"
  config = {


    bucket         = "lisadaly"
    dynamodb_table = "lisadaly"
    key            = "terraform/lisadaly/envs/staging/components/bastion.tfstate"
    region         = "ap-southeast-1"
    profile        = "default"


  }
}
data "terraform_remote_state" "database" {
  backend = "s3"
  config = {


    bucket         = "lisadaly"
    dynamodb_table = "lisadaly"
    key            = "terraform/lisadaly/envs/staging/components/database.tfstate"
    region         = "ap-southeast-1"
    profile        = "default"


  }
}
data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {


    bucket         = "lisadaly"
    dynamodb_table = "lisadaly"
    key            = "terraform/lisadaly/envs/staging/components/vpc.tfstate"
    region         = "ap-southeast-1"
    profile        = "default"


  }
}
variable "aws_accounts" {
  type = map(string)
  default = {

  }
}
