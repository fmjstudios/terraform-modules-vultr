variable "label" {
  type        = string
  description = "The labels to attach to the new object storage."
}

variable "region" {
  type        = map(string)
  description = "The datacenter region to create the Vultr VPC in. Defaults to Amsterdam, Netherlands."
  default = {
    "continent" = "Europe"
    "city"      = "Amsterdam"
  }
}



