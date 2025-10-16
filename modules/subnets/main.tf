# Public Subnets
resource "aws_subnet" "public" {
  count            = length(var.public_subnets)
  vpc_id            = var.vpc_id
  cidr_block       = var.public_subnets[count.index]
  availability_zone = var.availability_zones[count.index % length(var.availability_zones)]
  map_public_ip_on_launch = true

  tags = {
    Name = "public-${var.public_subnets[count.index]}"
  }
}

# Private Subnets
resource "aws_subnet" "private" {
  count            = length(var.private_subnets)
  vpc_id            = var.vpc_id
  cidr_block       = var.private_subnets[count.index]
  availability_zone = var.availability_zones[count.index % length(var.availability_zones)]

  tags = {
    Name = "private-${var.private_subnets[count.index]}"
  }
}

