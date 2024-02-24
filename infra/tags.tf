# variables.tf

variable "mandatory_tags" {
  type    = map(string)
  default = {
    Environment = "default"
    Owner       = "terraform"
  }
}

variable "optional_tags" {
  type    = map(string)
  default = {}
}

# main.tf

locals {
  all_tags = merge(var.mandatory_tags, var.optional_tags)
}

module "tags" {
  source          = "git::https://example.com/path/to/tagging-module.git"
  mandatory_tags  = var.mandatory_tags
  optional_tags   = var.optional_tags
}

# outputs.tf

output "all_tags" {
  value = module.tags.all_tags
}
