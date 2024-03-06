resource "aws_spot_instance_request" "cheap_worker" {
  # ami           = "ami-02d0a1cbe2c3e5ae4" # This is an example AMI ID for Amazon Linux in us-east-1; please replace it with the current one for your region.

  # ubuntu
  ami           = "ami-00381a880aa48c6c6"
  instance_type = "t3.medium"
  #   spot_price    = "0.01" # Set your max price

  root_block_device {
    volume_type = "gp3"
    volume_size = 20
  }

  iam_instance_profile = aws_iam_instance_profile.ssm_profile.name
  security_groups      = [aws_security_group.instance.name]

  tags = {
    Name = "SpotInstance"
  }
}
