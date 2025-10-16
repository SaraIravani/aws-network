variable "vpc_id" {
  description = "VPC ID to attach security groups"
  type        = string
}

variable "security_groups" {
  description = "List of security groups with ingress/egress rules"
  type = list(object({
    name        = string
    description = string
    ingress     = list(object({ from_port = number, to_port = number, protocol = string, cidr_blocks = list(string) }))
    egress      = list(object({ from_port = number, to_port = number, protocol = string, cidr_blocks = list(string) }))
  }))
  default = []
}

