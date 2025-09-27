resource "aws_vpc" "myVPC" {

    cidr_block = var.cidr

    tags = {
      Name = "myVPC"
    }
}

resource "aws_subnet" "public_subnet_1" {

  cidr_block = var.public_subnet_01_IP
  vpc_id = aws_vpc.myVPC.id
  availability_zone = "ap-south-1a"

  tags = {
    Name = "public_subnet_01"
  }
  
}

resource "aws_subnet" "public_subnet_02" {

  cidr_block = var.public_subnet_02_IP
  vpc_id = aws_vpc.myVPC.id
  availability_zone = "ap-south-1b"

  tags = {

    Name = "public_subnet_02"
  
  }
}

resource "aws_internet_gateway" "IG" {

  vpc_id = aws_vpc.myVPC.id

  tags = {

    Name = "IG"

  }
  
}

resource "aws_route_table" "public_route_table" {

  vpc_id = aws_vpc.myVPC.id

  tags = {
    Name = "public_route_table"
  }
}

resource "aws_route_table_association" "public_association_01" {

  subnet_id = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_route_table.id
  
}

resource "aws_route_table_association" "public_association_02" {
  
  subnet_id = aws_subnet.public_subnet_02.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route" "public_route" {
  
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.IG.id
  route_table_id = aws_route_table.public_route_table.id
 
}

