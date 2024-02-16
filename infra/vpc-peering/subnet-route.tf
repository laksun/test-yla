# Create route tables for Account 1 subnets
resource "aws_route_table" "rtb_account1" {
  count    = 3
  provider = aws.account1
  vpc_id   = aws_vpc.vpc_account1.id
  route {
    cidr_block                = aws_vpc.vpc_account2.cidr_block
    vpc_peering_connection_id = aws_vpc_peering_connection.peer_account1_to_account2.id
  }
}

# Associate Account 1 subnets with their route tables
resource "aws_route_table_association" "rta_account1" {
  count          = 3
  provider       = aws.account1
  subnet_id      = aws_subnet.subnet_account1[count.index].id
  route_table_id = aws_route_table.rtb_account1[count.index].id
}

# Create route tables for Account 2 subnets
resource "aws_route_table" "rtb_account2" {
  count    = 3
  provider = aws.account2
  vpc_id   = aws_vpc.vpc_account2.id
  route {
    cidr_block                = aws_vpc.vpc_account1.cidr_block
    vpc_peering_connection_id = aws_vpc_peering_connection.peer_account1_to_account2.id
  }
}

# Associate Account 2 subnets with their route tables
resource "aws_route_table_association" "rta_account2" {
  count          = 3
  provider       = aws.account2
  subnet_id      = aws_subnet.subnet_account2[count.index].id
  route_table_id = aws_route_table.rtb_account2[count.index].id
}
