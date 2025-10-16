###########################
# Public Subnet Routing
###########################

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = var.vpc_id
  tags   = { Name = "main-igw" }
}

# Public Route Table
resource "aws_route_table" "public" {
  vpc_id = var.vpc_id
  tags   = { Name = "public-rt" }
}

# Route Public Subnet to IGW
resource "aws_route" "public_internet" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

# Associate Public Subnets
resource "aws_route_table_association" "public_assoc" {
  count          = length(var.public_subnets)
  subnet_id      = var.public_subnets[count.index]
  route_table_id = aws_route_table.public.id
}


###########################
# Private Subnet Routing
###########################

# Private Route Table
resource "aws_route_table" "private" {
  vpc_id = var.vpc_id
  tags   = { Name = "private-rt" }
}

# NAT Gateway Route (conditional)
resource "aws_route" "private_nat" {
  count = var.use_nat_gateway ? length(var.private_subnets) : 0
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = var.nat_gateway_id
}

# VPC Endpoint for S3 (conditional)
resource "aws_vpc_endpoint" "s3" {
  count             = var.use_vpc_endpoint ? 1 : 0
  vpc_id            = var.vpc_id
  service_name      = "com.amazonaws.${var.region}.s3"
  vpc_endpoint_type = "Gateway"
  route_table_ids   = [aws_route_table.private.id]
}

# Associate Private Subnets
resource "aws_route_table_association" "private_assoc" {
  count          = length(var.private_subnets)
  subnet_id      = var.private_subnets[count.index]
  route_table_id = aws_route_table.private.id
}

