provider "aws" {
  region = var.region
}

# VPC
module "vpc" {
  source     = "./modules/vpc"
  cidr_block = var.vpc_cidr
}

# Subnets
module "subnets" {
  source            = "./modules/subnets"
  vpc_id            = module.vpc.id
  public_subnets    = var.public_subnets
  private_subnets   = var.private_subnets
  availability_zones = var.availability_zones
}

# Routing
module "routing" {
  source          = "./modules/routing"
  vpc_id          = module.vpc.id
  public_subnets  = module.subnets.public_subnets
  private_subnets = module.subnets.private_subnets
  availability_zones = var.availability_zones
  nat_gateway_id  = var.nat_gateway_id
  region          = var.region
}

# NAT
module "nat" {
  source        = "./modules/nat"
  public_subnet_id = module.subnets.public_subnets[0] 
  vpc_id        = module.vpc.id
  enable_nat    = var.enable_nat_gateway
  public_subnets = module.subnets.public_subnets
}

# Endpoints
module "endpoints" {
  source        = "./modules/endpoints"
  vpc_id        = module.vpc.id
  enable        = var.enable_vpc_endpoints
  private_subnets = module.subnets.private_subnets
  private_route_table_ids = module.routing.private_route_table_ids
  services      = var.vpc_endpoints_services
  region        = var.region
}

# Security
module "security" {
  source           = "./modules/security"
  vpc_id           = module.vpc.id
  security_groups  = var.security_groups
}

# Performance
module "performance" {
  source            = "./modules/performance"
#  vpc_id            = module.vpc.id
  performance_mode  = var.performance_mode
}

