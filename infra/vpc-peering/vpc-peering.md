To create a VPC peering connection between two VPCs across two different AWS accounts using Terraform, you will first need to set up the AWS provider and configure your Terraform files appropriately. Below is a simplified example to demonstrate how this can be done. This example assumes you have basic knowledge of Terraform and AWS.

### Step 1: Define Provider Configuration for Both AWS Accounts

You'll need AWS access credentials for both accounts. It's a best practice to use roles or profiles configured in your AWS credentials file instead of hardcoding access keys and secret keys.

Create a `providers.tf` file to define AWS providers:

```hcl
provider "aws" {
  alias  = "account1"
  region = "us-east-1"
  # Assuming you have set up an AWS profile for Account 1
  profile = "account1-profile"
}

provider "aws" {
  alias  = "account2"
  region = "us-east-1"
  # Assuming you have set up an AWS profile for Account 2
  profile = "account2-profile"
}
```

### Step 2: Define Your VPCs (if not already created)

If the VPCs are not already created, you need to define them in your Terraform configuration. This step is optional if your VPCs are already set up.

```hcl
# Define VPC in Account 1
resource "aws_vpc" "vpc_account1" {
  provider = aws.account1
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  tags = {
    Name = "Account1VPC"
  }
}

# Define VPC in Account 2
resource "aws_vpc" "vpc_account2" {
  provider = aws.account2
  cidr_block = "10.1.0.0/16"
  enable_dns_support = true
  tags = {
    Name = "Account2VPC"
  }
}
```

### Step 3: Create VPC Peering Connection

To establish a VPC peering connection, you must initiate the peering from one account and accept it from the other.

```hcl
# Request VPC Peering from Account 1 to Account 2
resource "aws_vpc_peering_connection" "peer_account1_to_account2" {
  provider = aws.account1
  vpc_id = aws_vpc.vpc_account1.id
  peer_vpc_id = aws_vpc.vpc_account2.id
  peer_owner_id = var.account2_owner_id # Account 2 AWS Account ID
  auto_accept = false

  tags = {
    Name = "Peer Account1 to Account2"
  }
}

# Accept VPC Peering in Account 2
resource "aws_vpc_peering_connection_accepter" "accept_peer_account1_to_account2" {
  provider = aws.account2
  vpc_peering_connection_id = aws_vpc_peering_connection.peer_account1_to_account2.id
  auto_accept = true

  tags = {
    Name = "Accept Peer Account1 to Account2"
  }
}
```

### Step 4: Add Routing for Peered VPCs

After establishing the peering connection, you need to update the route tables in each VPC to route traffic to the peered VPC.

```hcl
# Update routing table for Account 1 VPC
resource "aws_route" "route_to_account2" {
  provider = aws.account1
  route_table_id = aws_vpc.vpc_account1.main_route_table_id
  destination_cidr_block = aws_vpc.vpc_account2.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peer_account1_to_account2.id
}

# Update routing table for Account 2 VPC
resource "aws_route" "route_to_account1" {
  provider = aws.account2
  route_table_id = aws_vpc.vpc_account2.main_route_table_id
  destination_cidr_block = aws_vpc.vpc_account1.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peer_account1_to_account2.id
}
```

### Notes:
- Replace `var.account2_owner_id` with the actual AWS Account ID of Account 2.
- You need to have the AWS CLI configured with profiles for both accounts, as referenced in the `providers.tf`.
- Ensure you have the appropriate permissions in both AWS accounts to create and manage VPC peering connections and routes.

This example provides a basic framework for setting up VPC peering between two AWS accounts using Terraform. Depending on your specific requirements, you might need to adjust CIDR blocks, regions, or other configurations.