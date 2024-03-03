resource "aws_spot_instance_request" "cheap_worker" {
  ami           = "ami-02d0a1cbe2c3e5ae4" # This is an example AMI ID for Amazon Linux in us-east-1; please replace it with the current one for your region.
  instance_type = "t3.medium"
  #   spot_price    = "0.01" # Set your max price

  user_data = <<-EOF
                  #!/bin/bash
                  yum update -y
                  yum install -y https://packages.erlang-solutions.com/erlang-solutions-2.0-1.noarch.rpm
                  yum install -y erlang
                  rpm --import https://packages.erlang-solutions.com/rpm/erlang_solutions.asc
                  curl -s https://packagecloud.io/install/repositories/rabbitmq/rabbitmq-server/script.rpm.sh | bash
                  yum install -y rabbitmq-server
                  systemctl enable rabbitmq-server
                  systemctl start rabbitmq-server
                  rabbitmq-plugins enable rabbitmq_management
                  EOF

  iam_instance_profile = aws_iam_instance_profile.ssm_profile.name

  tags = {
    Name = "SpotInstance"
  }
}
