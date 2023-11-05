variable "description" {
  type        = string
  description = "The description for the Vultr VPC."
}

variable "cidr_block" {
  type        = string
  description = "The CIDR block to configure for the Vultr VPC."
  default     = "10.0.0.0/24"
}

variable "region" {
  type        = map(string)
  description = "The datacenter region to create the Vultr VPC in. Defaults to Frankfurt, Germany."
  default = {
    "continent" = "Europe"
    "city"      = "Frankfurt"
  }
}

