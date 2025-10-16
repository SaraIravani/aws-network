variable "enable_nat_gateway" {
  type    = bool
  default = false
  description = "Whether to create a NAT Gateway. Set to true for production environments."
}

variable "public_subnet_id" {
  description = "ID of one public subnet where the NAT Gateway will be placed"
  type        = string
}

