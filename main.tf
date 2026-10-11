resource "kubernetes_limit_range_v1" "limit_range_v1s" {
  for_each = var.limit_range_v1s


  metadata {
    annotations   = each.value.metadata.annotations
    generate_name = each.value.metadata.generate_name
    labels        = each.value.metadata.labels
    name          = each.value.metadata.name
    namespace     = each.value.metadata.namespace
  }

  dynamic "spec" {
    for_each = each.value.spec != null ? [each.value.spec] : []
    content {
      dynamic "limit" {
        for_each = spec.value.limit != null ? spec.value.limit : []
        content {
          default                 = limit.value.default
          default_request         = limit.value.default_request
          max                     = limit.value.max
          max_limit_request_ratio = limit.value.max_limit_request_ratio
          min                     = limit.value.min
          type                    = limit.value.type
        }
      }
    }
  }
}

