output "glue_classifiers_id" {
  description = "Map of id values across all glue_classifiers, keyed the same as var.glue_classifiers"
  value       = { for k, v in aws_glue_classifier.glue_classifiers : k => v.id if v.id != null && length(v.id) > 0 }
}
output "glue_classifiers_csv_classifier" {
  description = "Map of csv_classifier values across all glue_classifiers, keyed the same as var.glue_classifiers"
  value       = { for k, v in aws_glue_classifier.glue_classifiers : k => one(v.csv_classifier) if v.csv_classifier != null && length(v.csv_classifier) > 0 }
}
output "glue_classifiers_grok_classifier" {
  description = "Map of grok_classifier values across all glue_classifiers, keyed the same as var.glue_classifiers"
  value       = { for k, v in aws_glue_classifier.glue_classifiers : k => one(v.grok_classifier) if v.grok_classifier != null && length(v.grok_classifier) > 0 }
}
output "glue_classifiers_json_classifier" {
  description = "Map of json_classifier values across all glue_classifiers, keyed the same as var.glue_classifiers"
  value       = { for k, v in aws_glue_classifier.glue_classifiers : k => one(v.json_classifier) if v.json_classifier != null && length(v.json_classifier) > 0 }
}
output "glue_classifiers_name" {
  description = "Map of name values across all glue_classifiers, keyed the same as var.glue_classifiers"
  value       = { for k, v in aws_glue_classifier.glue_classifiers : k => v.name if v.name != null && length(v.name) > 0 }
}
output "glue_classifiers_region" {
  description = "Map of region values across all glue_classifiers, keyed the same as var.glue_classifiers"
  value       = { for k, v in aws_glue_classifier.glue_classifiers : k => v.region if v.region != null && length(v.region) > 0 }
}
output "glue_classifiers_xml_classifier" {
  description = "Map of xml_classifier values across all glue_classifiers, keyed the same as var.glue_classifiers"
  value       = { for k, v in aws_glue_classifier.glue_classifiers : k => one(v.xml_classifier) if v.xml_classifier != null && length(v.xml_classifier) > 0 }
}

