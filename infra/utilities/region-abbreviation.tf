locals {
  aws_regions = [
    "us-east-1",
    "us-west-1",
    "eu-central-1",
    "ap-southeast-1",
    // Add more regions as needed
  ]

  region_abbreviations = { for region in local.aws_regions :
    region => join("",
      [
        substr(region, 0, 2), # First 2 letters of the region part.
        substr(region, 3, 1), # First letter of the geographical descriptor.
        substr(region, -1, 1) # Last character, assuming it's the numerical identifier.
      ]
    )
  }
}

output "region_abbreviations" {
  value = local.region_abbreviations
}
