resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc_eks.id

  tags = {
    Name = "Public-Route"
  }
}


resource "aws_route" "pulic-route" {
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
  depends_on             = [aws_internet_gateway.igw]
}

resource "aws_route_table_association" "public_rt_assoc" {
  subnet_id      = aws_subnet.publicsubnet01block.id
  route_table_id = aws_route_table.public_route_table.id
}
