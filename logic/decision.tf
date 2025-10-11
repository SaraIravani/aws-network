module "nat" {
  source = "./modules/nat"
  count  = local.use_nat_gateway ? 1 : 0
}
module "endpoints" {
  source = "./modules/endpoints"
  count  = local.use_vpc_endpoint ? 1 : 0
}
