# Define subnets for VPC in Account 1
resource "aws_subnet" "subnet_account1" {
  count             = 3
  provider          = aws.account1
  vpc_id            = aws_vpc.vpc_account1.id
  cidr_block        = cidrsubnet(aws_vpc.vpc_account1.cidr_block, 8, count.index)
  availability_zone = element(data.aws_availability_zones.available.names, count.index)
  tags = {
    Name = "Account1-Subnet-${count.index + 1}"
  }
}

# Define subnets for VPC in Account 2
resource "aws_subnet" "subnet_account2" {
  count             = 3
  provider          = aws.account2
  vpc_id            = aws_vpc.vpc_account2.id
  cidr_block        = cidrsubnet(aws_vpc.vpc_account2.cidr_block, 8, count.index)
  availability_zone = element(data.aws_availability_zones.available.names, count.index)
  tags = {
    Name = "Account2-Subnet-${count.index + 1}"
  }
}
