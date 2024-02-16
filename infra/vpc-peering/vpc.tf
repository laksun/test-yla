# Define VPC in Account 1
resource "aws_vpc" "vpc_account1" {
  provider           = aws.account1
  cidr_block         = "10.0.0.0/16"
  enable_dns_support = true
  tags = {
    Name = "Account1VPC"
  }
}

# Define VPC in Account 2
resource "aws_vpc" "vpc_account2" {
  provider           = aws.account2
  cidr_block         = "10.1.0.0/16"
  enable_dns_support = true
  tags = {
    Name = "Account2VPC"
  }
}
