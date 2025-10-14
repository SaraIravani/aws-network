# Public Subnets
resource "aws_subnet" "public" {
  for_each = var.public_subnets
  vpc_id            = var.vpc_id
  cidr_block        = each.value
  availability_zone = var.availability_zones[index(keys(var.public_subnets), each.key)]
  map_public_ip_on_launch = true

  tags = {
    Name = "public-${each.value}"
  }
}

# Private Subnets
resource "aws_subnet" "private" {
  for_each = var.private_subnets
  vpc_id            = var.vpc_id
  cidr_block        = each.value
  availability_zone = var.availability_zones[index(keys(var.private_subnets), each.key)]

  tags = {
    Name = "private-${each.value}"
  }
}

