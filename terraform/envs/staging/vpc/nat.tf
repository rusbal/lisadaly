# ----------------------
# NAT Gateway
# ----------------------

resource "aws_eip" "eip1" {
  vpc  = true
  tags = local.tags
}

resource "aws_eip" "eip2" {
  vpc  = true
  tags = local.tags
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
