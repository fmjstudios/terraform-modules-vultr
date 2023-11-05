output "public_ip_address" {
  value       = vultr_instance.delta4x4_instance.main_ip
  description = "The main public IP address of the newly created Vultr instance."
}

output "os" {
  value       = vultr_instance.delta4x4_instance.os
  description = "The configured OS for the newly created Vultr instance."
}

output "vcpu_count" {
  value       = vultr_instance.delta4x4_instance.vcpu_count
  description = "The configured amount of vCPUs for the newly created Vultr instance."
}

output "disk" {
  value       = vultr_instance.delta4x4_instance.disk
  description = "The configured amount of disk space for the newly created Vultr instance."
}

output "ram" {
  value       = vultr_instance.delta4x4_instance.ram
  description = "The configured amount of RAM for the newly created Vultr instance."
}

output "hostname" {
  value       = vultr_instance.delta4x4_instance.hostname
  description = "The hostname of the newly created Vultr instance."
}

output "bandwidth" {
  value       = vultr_instance.delta4x4_instance.allowed_bandwidth
  description = "The allowed network bandwidth for the newly created Vultr instance."
}

output "backups" {
  value       = vultr_instance.delta4x4_instance.backups
  description = "Whether or not automatic backups via Vultr are configured for the server."
}

output "region" {
  value       = vultr_instance.delta4x4_instance.region
  description = "The datacenter region for the newly created Vultr instance."
}
