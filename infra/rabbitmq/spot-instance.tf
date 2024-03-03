resource "aws_spot_instance_request" "cheap_worker" {
  ami           = "ami-02d0a1cbe2c3e5ae4" # This is an example AMI ID for Amazon Linux in us-east-1; please replace it with the current one for your region.
  instance_type = "t3.medium"
  #   spot_price    = "0.01" # Set your max price

  root_block_device {
    volume_type = "gp3"
    volume_size = 20
  }

  user_data = <<-EOF
                  #!/bin/bash

                  # Update your system
                  sudo yum update -y

                  # Install Erlang, a dependency for RabbitMQ
                  sudo yum install -y erlang

                  # Add the RabbitMQ repository to your system
                  sudo tee /etc/yum.repos.d/rabbitmq.repo <<EOF
                  [rabbitmq-server]
                  name=RabbitMQ Repository
                  baseurl=https://packagecloud.io/rabbitmq/rabbitmq-server/el/7/\$basearch
                  gpgcheck=1
                  gpgkey=https://packagecloud.io/rabbitmq/rabbitmq-server/gpgkey
                        https://www.rabbitmq.com/rabbitmq-release-signing-key.asc
                  repo_gpgcheck=0
                  enabled=1

                  # Install RabbitMQ
                  sudo yum install rabbitmq-server -y

                  # Enable and start the RabbitMQ service
                  sudo systemctl enable rabbitmq-server
                  sudo systemctl start rabbitmq-server

                  # Check the status of RabbitMQ service
                  sudo systemctl status rabbitmq-server

                  # Optionally, enable the RabbitMQ Management Console
                  sudo rabbitmq-plugins enable rabbitmq_management

                  # The RabbitMQ Management Console will be available at http://server_name:15672/

                  EOF

  iam_instance_profile = aws_iam_instance_profile.ssm_profile.name
  security_groups      = [aws_security_group.instance.name]

  tags = {
    Name = "SpotInstance"
  }
}
