
# Create VPC Flow Logs
resource "aws_flow_log" "example_flow_log" {
  log_destination      = aws_cloudwatch_log_group.flow_log_group.arn
  log_destination_type = "cloud-watch-logs"
  traffic_type         = "ALL"
  vpc_id               = aws_vpc.example_vpc.id
}
