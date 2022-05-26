# Auto-generated by fogg. Do not edit
# Make improvements in fogg, so that everyone can benefit.

locals {
  tags = {
    Name = "lisadaly"
  }
  vpc_cidr        = "10.0.0.0/16"
  vpc_name        = "Project VPC"
  private_subnets = true
  aws_region      = "ap-southeast-1"
  aws_zones       = ["ap-southeast-1a", "ap-southeast-1b"]
}

module "terraform-aws-vpc" {
  source          = "github.com/scholzj/terraform-aws-vpc"
  aws_region      = local.aws_region
  aws_zones       = local.aws_zones
  private_subnets = local.private_subnets
  tags            = local.tags
  vpc_cidr        = local.vpc_cidr
  vpc_name        = local.vpc_name

}
