variable "label" {
  type        = string
  description = "The label for the new Vultr instance."
}

variable "region" {
  type        = map(string)
  description = "The datacenter region to create the Vultr instance in. Defaults to Frankfurt, Germany."
  default = {
    "continent" = "Europe"
    "city"      = "Frankfurt"
  }
}

variable "vpc_ids" {
  type        = list(string)
  description = "A list of VPC ID's to attached the new instance to."

}

# variable "hardware" {
#   type        = map(string)
#   description = "The hardware configuration for the new Vultr instance."
#   default     = {}
# }

variable "plan" {
  type        = string
  description = "The Vultr plan to use for the newly created instance."
}

variable "os_name" {
  type        = string
  description = "The OS disk image name to use for the new Vultr instance."
  default     = "Ubuntu 22.04 LTS x64"
}

variable "enable_ipv6" {
  type        = bool
  description = "Whether or not to enable IPv6 networking for the new Vultr instance. Defaults to 'false'."
  default     = false
}

variable "backups" {
  type        = map(string)
  description = "The backup configuration for the new Vultr instance."
  default     = {}
}

variable "ddos_protection" {
  type        = bool
  description = "Whether or not to enable protection from DDoS attacks by Vultr. Defaults to 'true'."
  default     = true
}

variable "activation_email" {
  type        = bool
  description = "Whether or not to send an automatic activation email upon creation of the new instance. Defaults to 'false'."
  default     = false
}

variable "tags" {
  type        = list(string)
  description = "Tags to attach to the new Vultr instance."
  default     = []
}

variable "cloud_config" {
  type        = any
  description = "Values for rendering of a Cloud-init template file."
  default     = {}
}
