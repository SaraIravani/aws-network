variable "vpc_id" {
  description = "The VPC ID where subnets reside"
  type        = string
}

variable "public_subnets" {
  description = "Map of public subnet CIDRs, key = identifier"
  type        = map(string)
}

variable "private_subnets" {
  description = "Map of private subnet CIDRs, key = identifier"
  type        = map(string)
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

