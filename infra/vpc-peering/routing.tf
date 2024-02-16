# Update routing table for Account 1 VPC
resource "aws_route" "route_to_account2" {
  provider                  = aws.account1
  route_table_id            = aws_vpc.vpc_account1.main_route_table_id
  destination_cidr_block    = aws_vpc.vpc_account2.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peer_account1_to_account2.id
}

# Update routing table for Account 2 VPC
resource "aws_route" "route_to_account1" {
  provider                  = aws.account2
  route_table_id            = aws_vpc.vpc_account2.main_route_table_id
  destination_cidr_block    = aws_vpc.vpc_account1.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peer_account1_to_account2.id
}
