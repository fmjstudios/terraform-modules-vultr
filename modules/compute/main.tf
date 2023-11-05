data "vultr_os" "os_image" {
  filter {
    name   = "name"
    values = [var.os_name]
  }
}

# data "vultr_plan" "plan_config" {
#   filter {
#     name   = "vcpu_count"
#     values = [var.hardware["vcpus"]]
#   }

#   filter {
#     name   = "ram"
#     values = [var.hardware["ram"]]
#   }

#   filter {
#     name   = "disk"
#     values = [var.hardware["disk"]]
#   }
# }

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
  os_image = data.vultr_os.os_image.id
  # plan     = data.vultr_plan.plan_config.id
  region             = data.vultr_region.region_config.id
  ssh_allowed_users  = join(" ", var.cloud_config["ssh"].allow_users)
  ssh_allowed_groups = join(" ", var.cloud_config["ssh"].allow_groups)
}

data "template_file" "cloud_config" {
  template = file("${path.module}/templates/cloud-config.tftpl")

  vars = {
    users                 = yamlencode(var.cloud_config["users"])
    enable_ssh_pwauth     = var.cloud_config["enable_ssh_pwauth"]
    pwauth_expire_passwds = var.cloud_config["pwauth_expire_passwds"]
    chpasswd_users        = indent(4, yamlencode(var.cloud_config["chpasswd_users"]))

    timezone = var.cloud_config["timezone"]
    locale   = var.cloud_config["locale"]

    preserve_hostname         = var.cloud_config["preserve_hostname"]
    hostname                  = var.cloud_config["hostname"]
    fqdn                      = var.cloud_config["fqdn"]
    prefer_fqdn_over_hostname = var.cloud_config["prefer_fqdn_over_hostname"]
    manage_etc_hosts          = var.cloud_config["manage_etc_hosts"]

    ssh_port           = var.cloud_config["ssh"].port
    ssh_listen_address = var.cloud_config["ssh"].listen_address
    ssh_log_level      = var.cloud_config["ssh"].log_level
    ssh_allow_users    = local.ssh_allowed_users
    ssh_allow_groups   = local.ssh_allowed_groups
  }
}

data "template_cloudinit_config" "cloud_config" {
  gzip          = false
  base64_encode = false

  part {
    filename     = "init.cfg"
    content_type = "text/cloud-config"
    content      = data.template_file.cloud_config.rendered
  }
}

resource "vultr_instance" "delta4x4_instance" {
  label   = var.label
  region  = local.region
  os_id   = local.os_image
  plan    = var.plan
  vpc_ids = var.vpc_ids

  user_data   = data.template_cloudinit_config.cloud_config.rendered
  enable_ipv6 = var.enable_ipv6
  backups     = var.backups["enabled"] ? "enabled" : "disabled"
  backups_schedule {
    type = var.backups["type"]
    hour = var.backups["hour"]
  }

  tags             = length(var.tags) > 0 ? var.tags : null
  ddos_protection  = var.ddos_protection
  activation_email = var.activation_email
}
