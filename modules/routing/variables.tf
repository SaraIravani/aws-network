variable "vpc_id" {
  description = "The VPC ID where subnets reside"
  type        = string
}

variable "region" {
  description = "AWS region for resources"
  type        = string
}

variable "public_subnets" {
  description = "List of public subnet IDs"
  type        = list(string)
}

variable "private_subnets" {
  description = "List of private subnet IDs"
  type        = list(string)
}


variable "availability_zones" {
  description = "List of availability zones for AZ assignment"
  type        = list(string)
}

variable "use_nat_gateway" {
  description = "Enable NAT Gateway for private subnets"
  type        = bool
  default     = false
}

variable "nat_gateway_id" {
  description = "Existing NAT Gateway ID if use_nat_gateway is true"
  type        = string
  default     = ""
}

variable "use_vpc_endpoint" {
  description = "Enable VPC endpoints for private subnet (S3/DynamoDB)"
  type        = bool
  default     = true
}

