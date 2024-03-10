#public subnet
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"

  tags = {
    Name = "PublicSubnet"
  }
}


# private subnet
resource "aws_subnet" "private_subnet" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.2.0/24"

  tags = {
    Name = "PrivateSubnet"
  }
}