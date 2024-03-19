resource "aws_subnet" "publicsubnet01block" {
  vpc_id                  = aws_vpc.vpc_eks.id
  cidr_block              = "192.168.0.0/18"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1a"

  tags = {
    Name = "PublicSubnet01Block"
  }
}
