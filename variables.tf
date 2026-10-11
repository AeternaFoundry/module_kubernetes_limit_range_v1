variable "limit_range_v1s" {
  description = <<EOT
Map of limit_range_v1s, attributes below
Required:
    - metadata (block):
        - annotations (optional)
        - generate_name (optional)
        - labels (optional)
        - name (optional)
        - namespace (optional)
Optional:
    - spec (block):
        - limit (optional, block):
            - default (optional)
            - default_request (optional)
            - max (optional)
            - max_limit_request_ratio (optional)
            - min (optional)
            - type (optional)
EOT

  type = map(object({
    metadata = object({
      annotations   = optional(map(string))
      generate_name = optional(string)
      labels        = optional(map(string))
      name          = optional(string)
      namespace     = optional(string)
    })
    spec = optional(object({
      limit = optional(list(object({
        default                 = optional(map(string))
        default_request         = optional(map(string))
        max                     = optional(map(string))
        max_limit_request_ratio = optional(map(string))
        min                     = optional(map(string))
        type                    = optional(string)
      })))
    }))
  }))
}

