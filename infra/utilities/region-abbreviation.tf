locals {
  aws_regions = [
    "us-east-1",
    "us-west-1",
    "eu-central-1",
    // Add more regions as needed
  ]

  region_abbreviations = { for region in local.aws_regions :
    region => join("", [substr(region, 0, 2), substr(region, 3, 1), substr(region, 7, 1)])
  }
}

output "region_abbreviations" {
  value = local.region_abbreviations
}
