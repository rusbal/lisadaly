locals {
  tags = {
    Name = "lisadaly"
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
  tags            = local.tags
  vpc_cidr        = local.vpc_cidr
  vpc_name        = local.vpc_name

}

# ----------------------
# NAT Gateway
# ----------------------

resource "aws_network_interface" "eni1" {
  subnet_id = module.myvpc.subnet_ids[0]
  tags      = local.tags
}

resource "aws_network_interface" "eni2" {
  subnet_id = module.myvpc.subnet_ids[1]
  tags      = local.tags
}

resource "aws_eip" "eip1" {
  vpc               = true
  network_interface = aws_network_interface.eni1.id
  tags              = local.tags
}

resource "aws_eip" "eip2" {
  vpc               = true
  network_interface = aws_network_interface.eni2.id
  tags              = local.tags
}

resource "aws_nat_gateway" "nat1" {
  allocation_id = aws_eip.eip1.id
  subnet_id     = module.myvpc.subnet_ids[0]
  tags          = local.tags
}

resource "aws_nat_gateway" "nat2" {
  allocation_id = aws_eip.eip2.id
  subnet_id     = module.myvpc.subnet_ids[1]
  tags          = local.tags
}

# ----------------------
# Private Subnets
# ----------------------

resource "aws_subnet" "subnet_web_1" {
  vpc_id            = module.myvpc.vpc_id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "ap-southeast-1a"
  tags              = local.tags
}

resource "aws_subnet" "subnet_web_2" {
  vpc_id            = module.myvpc.vpc_id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "ap-southeast-1b"
  tags              = local.tags
}

resource "aws_subnet" "subnet_app_1" {
  vpc_id            = module.myvpc.vpc_id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "ap-southeast-1a"
  tags              = local.tags
}

resource "aws_subnet" "subnet_app_2" {
  vpc_id            = module.myvpc.vpc_id
  cidr_block        = "10.0.5.0/24"
  availability_zone = "ap-southeast-1b"
  tags              = local.tags
}

resource "aws_subnet" "subnet_db_1" {
  vpc_id            = module.myvpc.vpc_id
  cidr_block        = "10.0.6.0/24"
  availability_zone = "ap-southeast-1a"
  tags              = local.tags
}

resource "aws_subnet" "subnet_db_2" {
  vpc_id            = module.myvpc.vpc_id
  cidr_block        = "10.0.7.0/24"
  availability_zone = "ap-southeast-1b"
  tags              = local.tags
}
