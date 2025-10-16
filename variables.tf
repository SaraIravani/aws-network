# Region
variable "region" {
  description = "AWS Region to deploy resources"
  type        = string
  default     = "ca-central-1"
}

# VPC
variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

# Subnets
variable "public_subnets" {
  type = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
  type = list(string)
  default = ["10.0.11.0/24", "10.0.12.0/24"]
}

variable "availability_zones" {
  type = list(string)
  default = ["ca-central-1a", "ca-central-1b"]
}

# NAT
variable "enable_nat_gateway" {
  type    = bool
  default = false
}

variable "nat_gateway_id" {
  default = ""  # Optional if NAT is enabled dynamically
}

# VPC Endpoints
variable "enable_vpc_endpoints" {
  type    = bool
  default = true
}

# Routing
variable "custom_routes" {
  type = list(object({
    destination_cidr_block = string
    target_type            = string  # "igw" | "nat" | "vgw"
    target_id              = string
  }))
  default = []
}

# Security
variable "security_groups" {
  type = list(object({
    name        = string
    description = string
    ingress     = list(object({ from_port = number, to_port = number, protocol = string, cidr_blocks = list(string) }))
    egress      = list(object({ from_port = number, to_port = number, protocol = string, cidr_blocks = list(string) }))
  }))
  default = []
}

# Performance
variable "performance_mode" {
  description = "Options: cost_optimized, balanced, high_performance"
  default     = "balanced"
}

# Endpoint services
variable "vpc_endpoints_services" {
  type    = list(string)
  default = ["s3", "dynamodb"]
}

