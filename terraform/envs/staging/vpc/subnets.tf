# ----------------------
# Private Subnets
# ----------------------

resource "aws_subnet" "subnet_web_1" {
  vpc_id            = module.myvpc.vpc_id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "ap-southeast-1a"
  tags = merge(local.private_tags, {
    Name = "PRIVATE Subnet Web 1"
  })
}

resource "aws_subnet" "subnet_web_2" {
  vpc_id            = module.myvpc.vpc_id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "ap-southeast-1b"
  tags = merge(local.private_tags, {
    Name = "PRIVATE Subnet Web 2"
  })
}

resource "aws_subnet" "subnet_app_1" {
  vpc_id            = module.myvpc.vpc_id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "ap-southeast-1a"
  tags = merge(local.private_tags, {
    Name = "PRIVATE Subnet App 1"
  })
}

resource "aws_subnet" "subnet_app_2" {
  vpc_id            = module.myvpc.vpc_id
  cidr_block        = "10.0.5.0/24"
  availability_zone = "ap-southeast-1b"
  tags = merge(local.private_tags, {
    Name = "PRIVATE Subnet App 2"
  })
}

resource "aws_subnet" "subnet_db_1" {
  vpc_id            = module.myvpc.vpc_id
  cidr_block        = "10.0.6.0/24"
  availability_zone = "ap-southeast-1a"
  tags = merge(local.private_tags, {
    Name = "PRIVATE Subnet DB 1"
  })
}

resource "aws_subnet" "subnet_db_2" {
  vpc_id            = module.myvpc.vpc_id
  cidr_block        = "10.0.7.0/24"
  availability_zone = "ap-southeast-1b"
  tags = merge(local.private_tags, {
    Name = "PRIVATE Subnet DB 2"
  })
}
