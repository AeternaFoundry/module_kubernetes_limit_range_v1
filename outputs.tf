output "limit_range_v1s_id" {
  description = "Map of id values across all limit_range_v1s, keyed the same as var.limit_range_v1s except keys with no id are omitted"
  value       = { for k, v in kubernetes_limit_range_v1.limit_range_v1s : k => v.id if v.id != null && length(v.id) > 0 }
}
output "limit_range_v1s_metadata" {
  description = "Map of metadata values across all limit_range_v1s, keyed the same as var.limit_range_v1s except keys with no metadata are omitted"
  value       = { for k, v in kubernetes_limit_range_v1.limit_range_v1s : k => one(v.metadata) if v.metadata != null && length(v.metadata) > 0 }
}
output "limit_range_v1s_spec" {
  description = "Map of spec values across all limit_range_v1s, keyed the same as var.limit_range_v1s except keys with no spec are omitted"
  value       = { for k, v in kubernetes_limit_range_v1.limit_range_v1s : k => one(v.spec) if v.spec != null && length(v.spec) > 0 }
}

