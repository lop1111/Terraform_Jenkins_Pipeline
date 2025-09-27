resource "aws_vpc" "myVPC" {

    cidr_block = var.cidr

    tags = {
      Name = "myVPC"
    }
}