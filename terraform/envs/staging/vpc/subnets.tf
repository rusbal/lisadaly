# ----------------------
# Private Subnets
# ----------------------

resource "aws_subnet" "subnet_web_1" {
  vpc_id            = module.myvpc.vpc_id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "ap-southeast-1a"
  tags              = local.private_tags
}

resource "aws_subnet" "subnet_web_2" {
  vpc_id            = module.myvpc.vpc_id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "ap-southeast-1b"
  tags              = local.private_tags
}

resource "aws_subnet" "subnet_app_1" {
  vpc_id            = module.myvpc.vpc_id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "ap-southeast-1a"
  tags              = local.private_tags
}

resource "aws_subnet" "subnet_app_2" {
  vpc_id            = module.myvpc.vpc_id
  cidr_block        = "10.0.5.0/24"
  availability_zone = "ap-southeast-1b"
  tags              = local.private_tags
}

resource "aws_subnet" "subnet_db_1" {
  vpc_id            = module.myvpc.vpc_id
  cidr_block        = "10.0.6.0/24"
  availability_zone = "ap-southeast-1a"
  tags              = local.private_tags
}

resource "aws_subnet" "subnet_db_2" {
  vpc_id            = module.myvpc.vpc_id
  cidr_block        = "10.0.7.0/24"
  availability_zone = "ap-southeast-1b"
  tags              = local.private_tags
}
