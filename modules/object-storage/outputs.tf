output "region" {
  value       = vultr_object_storage.delta4x4_object_storage.region
  description = "The geographical region for your new Vultr object storage"
}

output "s3_access_key" {
  value       = vultr_object_storage.delta4x4_object_storage.s3_access_key
  description = "The S3-compatible access key for the new object storage"
}

output "s3_secret_key" {
  value       = vultr_object_storage.delta4x4_object_storage.s3_secret_key
  description = "The S3-compatible secret key for the new object storage"
}

output "s3_hostname" {
  value       = vultr_object_storage.delta4x4_object_storage.s3_hostname
  description = "The hostname for the newly created Vultr object storage"
}
