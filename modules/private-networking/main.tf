data "vultr_region" "region_config" {
  filter {
    name   = "continent"
    values = [var.region["continent"]]
  }

  filter {
    name   = "city"
    values = [var.region["city"]]
  }
}

locals {
  cidr_config_list = split("/", var.cidr_block)

  ipv4_subnet      = local.cidr_config_list[0]
  ipv4_subnet_mask = local.cidr_config_list[1]
  region           = data.vultr_region.region_config.id
}

resource "vultr_vpc" "detlta4x4_vpc" {
  description = var.description
  region      = local.region

  v4_subnet      = local.ipv4_subnet
  v4_subnet_mask = local.ipv4_subnet_mask
}
