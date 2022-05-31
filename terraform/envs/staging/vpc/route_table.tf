resource "aws_route_table" "priv_rt_one" {
  vpc_id = module.myvpc.vpc_id

  route {
    nat_gateway_id = aws_nat_gateway.nat1.id
    cidr_block = "10.0.2.0/24"
  }

  route {
    nat_gateway_id = aws_nat_gateway.nat1.id
    cidr_block = "10.0.4.0/24"
  }

  route {
    nat_gateway_id = aws_nat_gateway.nat1.id
    cidr_block = "10.0.6.0/24"
  }

  tags = merge(local.tags, { Name = "AZ-one RT" })
}

resource "aws_route_table" "priv_rt_two" {
  vpc_id = module.myvpc.vpc_id

  route {
    nat_gateway_id = aws_nat_gateway.nat2.id
    cidr_block = "10.0.3.0/24"
  }

  route {
    nat_gateway_id = aws_nat_gateway.nat2.id
    cidr_block = "10.0.5.0/24"
  }

  route {
    nat_gateway_id = aws_nat_gateway.nat2.id
    cidr_block = "10.0.7.0/24"
  }

  tags = merge(local.tags, { Name = "AZ-two RT" })
}
