locals {
  project = "lisadaly"
  tags = {
    Name = local.project
  }
  public_tags = {
    Name = "${local.project} PUBLIC"
  }
  private_tags = {
    Name = "${local.project} private"
  }
  vpc_cidr        = "10.0.0.0/16"
  vpc_name        = "Project VPC"
  private_subnets = false
  aws_region      = "ap-southeast-1"
  aws_zones       = ["ap-southeast-1a", "ap-southeast-1b"]
}

module "myvpc" {
  source          = "github.com/scholzj/terraform-aws-vpc"
  aws_region      = local.aws_region
  aws_zones       = local.aws_zones
  private_subnets = local.private_subnets
  tags            = local.public_tags
  vpc_cidr        = local.vpc_cidr
  vpc_name        = local.vpc_name

}
