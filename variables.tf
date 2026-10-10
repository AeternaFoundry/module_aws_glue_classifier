variable "glue_classifiers" {
  description = <<EOT
Map of glue_classifiers, attributes below
Required:
    - name
Optional:
    - region
    - csv_classifier (block):
        - allow_single_column (optional)
        - contains_header (optional)
        - custom_datatype_configured (optional)
        - custom_datatypes (optional)
        - delimiter (optional)
        - disable_value_trimming (optional)
        - header (optional)
        - quote_symbol (optional)
        - serde (optional)
    - grok_classifier (block):
        - classification (required)
        - custom_patterns (optional)
        - grok_pattern (required)
    - json_classifier (block):
        - json_path (required)
    - xml_classifier (block):
        - classification (required)
        - row_tag (required)
EOT

  type = map(object({
    name   = string
    region = optional(string)
    csv_classifier = optional(object({
      allow_single_column        = optional(bool)
      contains_header            = optional(string)
      custom_datatype_configured = optional(bool)
      custom_datatypes           = optional(list(string))
      delimiter                  = optional(string)
      disable_value_trimming     = optional(bool)
      header                     = optional(list(string))
      quote_symbol               = optional(string)
      serde                      = optional(string)
    }))
    grok_classifier = optional(object({
      classification  = string
      custom_patterns = optional(string)
      grok_pattern    = string
    }))
    json_classifier = optional(object({
      json_path = string
    }))
    xml_classifier = optional(object({
      classification = string
      row_tag        = string
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.glue_classifiers : (
        v.csv_classifier == null || (v.csv_classifier.custom_datatypes == null || (alltrue([for x in v.csv_classifier.custom_datatypes : contains(["BINARY", "BOOLEAN", "DATE", "DECIMAL", "DOUBLE", "FLOAT", "INT", "LONG", "SHORT", "STRING", "TIMESTAMP"], x)])))
      )
    ])
    error_message = "must be one of: BINARY, BOOLEAN, DATE, DECIMAL, DOUBLE, FLOAT, INT, LONG, SHORT, STRING, TIMESTAMP"
  }
  validation {
    condition = alltrue([
      for k, v in var.glue_classifiers : (
        v.grok_classifier == null || (v.grok_classifier.custom_patterns == null || (length(v.grok_classifier.custom_patterns) >= 0 && length(v.grok_classifier.custom_patterns) <= 16000))
      )
    ])
    error_message = "must be between 0 and 16000 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.glue_classifiers : (
        v.grok_classifier == null || (length(v.grok_classifier.grok_pattern) >= 1 && length(v.grok_classifier.grok_pattern) <= 2048)
      )
    ])
    error_message = "must be between 1 and 2048 characters"
  }
  # Note: 3 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

