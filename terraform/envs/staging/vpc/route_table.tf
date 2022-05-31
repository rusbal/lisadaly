resource "aws_route_table" "priv_rt_one" {
  vpc_id = module.myvpc.vpc_id
  tags = merge(local.tags, { Name = "Private RT1" })

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat1.id
  }
}

resource "aws_route_table" "priv_rt_two" {
  vpc_id = module.myvpc.vpc_id
  tags = merge(local.tags, { Name = "Private RT2" })

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat2.id
  }
}

resource "aws_route_table_association" "a1" {
  subnet_id      = aws_subnet.subnet_web_1.id
  route_table_id = aws_route_table.priv_rt_one.id
}

resource "aws_route_table_association" "a2" {
  subnet_id      = aws_subnet.subnet_web_2.id
  route_table_id = aws_route_table.priv_rt_two.id
}

resource "aws_route_table_association" "b1" {
  subnet_id      = aws_subnet.subnet_app_1.id
  route_table_id = aws_route_table.priv_rt_one.id
}

resource "aws_route_table_association" "b2" {
  subnet_id      = aws_subnet.subnet_app_2.id
  route_table_id = aws_route_table.priv_rt_two.id
}

resource "aws_route_table_association" "c1" {
  subnet_id      = aws_subnet.subnet_db_1.id
  route_table_id = aws_route_table.priv_rt_one.id
}

resource "aws_route_table_association" "c2" {
  subnet_id      = aws_subnet.subnet_db_2.id
  route_table_id = aws_route_table.priv_rt_two.id
}
