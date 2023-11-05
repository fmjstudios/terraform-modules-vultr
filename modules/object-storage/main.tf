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


data "vultr_object_storage_cluster" "cluster_config" {
  filter {
    name   = "region"
    values = [data.vultr_region.region_config.id]
  }
}

locals {
  cluster_id = data.vultr_object_storage_cluster.cluster_config.id
}

resource "vultr_object_storage" "delta4x4_object_storage" {
  label      = var.label
  cluster_id = local.cluster_id
}
