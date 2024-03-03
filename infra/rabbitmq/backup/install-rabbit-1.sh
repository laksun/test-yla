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
                  yum update -y
                  yum install -y python3
                  sudo python3 -m ensurepip
                  EOF