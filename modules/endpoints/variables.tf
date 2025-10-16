variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}
variable "private_route_table_ids" {
  description = "List of private route table IDs for VPC endpoints"
  type        = list(string)
}


variable "enable" {
  description = "Enable or disable VPC endpoints"
  type        = bool
  default     = true
}

variable "private_subnets" {
  description = "List of private subnet IDs for the endpoints"
  type        = list(string)
}

variable "region" {
  description = "AWS region"
  type        = string
}

variable "services" {
  type    = list(string)
  default = ["s3", "dynamodb"]
}

