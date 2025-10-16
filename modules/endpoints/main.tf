##########################################
# NOTE:
# Default endpoints (Gateway type):
# - S3
# - DynamoDB
#
# Add Interface Endpoints later if needed for:
# - SSM (Systems Manager) → for Session Manager & Parameter Store
# - ECR (Elastic Container Registry) → for pulling Docker images
# - CloudWatch Logs → for sending application or system logs
#
# Interface endpoints use private IPs inside your VPC
# and don't require a NAT Gateway to access AWS services.
##########################################

# S3 Gateway Endpoint
resource "aws_vpc_endpoint" "s3" {
  count             = var.enable && contains(var.services, "s3") ? 1 : 0
  vpc_id            = var.vpc_id
  service_name      = "com.amazonaws.${var.region}.s3"
  vpc_endpoint_type = "Gateway"
  route_table_ids   = var.private_route_table_ids

  tags = {
    Name = "s3-endpoint"
  }
}

# DynamoDB Gateway Endpoint
resource "aws_vpc_endpoint" "dynamodb" {
  count             = var.enable && contains(var.services, "dynamodb") ? 1 : 0
  vpc_id            = var.vpc_id
  service_name      = "com.amazonaws.${var.region}.dynamodb"
  vpc_endpoint_type = "Gateway"
  route_table_ids   = var.private_route_table_ids

  tags = {
    Name = "dynamodb-endpoint"
  }
}

