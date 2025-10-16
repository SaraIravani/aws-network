##########################################
# NOTE: Performance module
# Current functionality:
# - Chooses EC2 instance type based on performance_mode:
#   cost_optimized / balanced / high_performance
#
# Future enhancements (optional):
# - Autoscaling policies: min/max replicas for EC2 or K8s nodes
# - Placement Groups: reduce latency or increase network throughput
# - Caching, EBS optimization, and network throughput tuning
##########################################

# Example: Adjust instance type based on performance mode
# Can be extended for autoscaling policies, placement groups, etc.

locals {
  selected_instance_type = var.performance_mode == "high_performance" ? "t3.large" :
                           var.performance_mode == "balanced"        ? "t3.medium" :
                           "t3.small"
}

output "recommended_instance_type" {
  value = local.selected_instance_type
}

