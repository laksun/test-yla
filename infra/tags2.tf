# module/tagging-module/main.tf

variable "mandatory_tags" {
  type    = map(string)
}

variable "optional_tags" {
  type    = map(string)
  default = {}
}

locals {
  all_tags = merge(var.mandatory_tags, var.optional_tags)
}

output "all_tags" {
  value = local.all_tags
}
