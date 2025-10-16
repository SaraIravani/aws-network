variable "performance_mode" {
  description = "Options: cost_optimized, balanced, high_performance"
  type        = string
  default     = "balanced"
}

variable "instance_types" {
  description = "Map of service names to EC2 instance types for performance tuning"
  type        = map(string)
  default     = {}
}

