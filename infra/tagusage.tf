# Usage in another module or configuration

module "ec2_instance" {
  source     = "terraform/aws/ec2"
  # ... other configuration for EC2 instance ...

  tags       = module.tags.all_tags
}
