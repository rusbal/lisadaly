resource "aws_route_table" "rt_one" {
  vpc_id = module.myvpc.vpc_id

  route {
    cidr_block = "10.0.2.0/24"
    nat_gateway_id = aws_nat_gateway.nat1.id
  }

  route {
    cidr_block = "10.0.4.0/24"
    nat_gateway_id = aws_nat_gateway.nat1.id
  }

  route {
    cidr_block = "10.0.6.0/24"
    nat_gateway_id = aws_nat_gateway.nat1.id
  }

  tags = merge(local.tags, { Name = "AZ-one RT" })
}

resource "aws_route_table" "rt_two" {
  vpc_id = module.myvpc.vpc_id

  route {
    cidr_block = "10.0.3.0/24"
    nat_gateway_id = aws_nat_gateway.nat2.id
  }

  route {
    cidr_block = "10.0.5.0/24"
    nat_gateway_id = aws_nat_gateway.nat2.id
  }

  route {
    cidr_block = "10.0.7.0/24"
    nat_gateway_id = aws_nat_gateway.nat2.id
  }

  tags = merge(local.tags, { Name = "AZ-two RT" })
}
