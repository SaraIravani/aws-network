variable "public_subnet_id" {
  description = "ID of the public subnet for NAT gateway"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where NAT gateway will be created"
  type        = string
}

variable "enable_nat" {
  description = "Enable or disable NAT gateway"
  type        = bool
  default     = true
}

variable "enable_nat_gateway" {
  description = "Enable or disable NAT Gateway"
  type        = bool
  default     = true
}

variable "public_subnets" {
  description = "List of public subnet IDs"
  type        = list(string)
  default     = []
}

