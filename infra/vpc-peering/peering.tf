# Request VPC Peering from Account 1 to Account 2
resource "aws_vpc_peering_connection" "peer_account1_to_account2" {
  provider      = aws.account1
  vpc_id        = aws_vpc.vpc_account1.id
  peer_vpc_id   = aws_vpc.vpc_account2.id
  peer_owner_id = var.account2_owner_id # Account 2 AWS Account ID
  auto_accept   = false

  tags = {
    Name = "Peer Account1 to Account2"
  }
}

# Accept VPC Peering in Account 2
resource "aws_vpc_peering_connection_accepter" "accept_peer_account1_to_account2" {
  provider                  = aws.account2
  vpc_peering_connection_id = aws_vpc_peering_connection.peer_account1_to_account2.id
  auto_accept               = true

  tags = {
    Name = "Accept Peer Account1 to Account2"
  }
}

