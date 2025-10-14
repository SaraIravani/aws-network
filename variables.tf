variable "region" {
  description = "AWS region for deployment"
  default = "ca-central-1"
}

variable "vpc_cidr" {
  description = "CIDR block for main VPC"
  default = "10.0.0.0/16"
}

variable "public_subnets" {
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
  default = ["10.0.11.0/24", "10.0.12.0/24"]
}

variable "availability_zones" {
  type = list(string)
  default = ["ca-central-1a", "ca-central-1b"]
}

variable "enable_nat_gateway" {
  type    = bool
  default = false
}

variable "enable_vpc_endpoints" {
  type    = bool
  default = true
}

variable "performance_mode" {
  description = "Options: cost_optimized, balanced, high_performance"
  default     = "balanced"
}

# Routing variables
variable "custom_routes" {
  type = list(object({
    destination_cidr_block = string
    target_type            = string  # "igw" | "nat" | "vgw" etc.
    target_id              = string
  }))
  default = []
}

# Security variables
variable "security_groups" {
  type = list(object({
    name        = string
    description = string
    ingress     = list(object({ from_port = number, to_port = number, protocol = string, cidr_blocks = list(string) }))
    egress      = list(object({ from_port = number, to_port = number, protocol = string, cidr_blocks = list(string) }))
  }))
  default = []
}

# Endpoint variables
variable "vpc_endpoints_services" {
  type    = list(string) # e.g., ["s3", "dynamodb"]
  default = ["s3", "dynamodb"]
}

