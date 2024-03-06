# Use Ubuntu 20.04 LTS as base image
FROM ubuntu:20.04

# Set noninteractive installation mode
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies and add Erlang Solutions repository
RUN apt-get update && \
    apt-get install -y wget gnupg software-properties-common && \
    wget https://packages.erlang-solutions.com/erlang-solutions_2.0_all.deb && \
    dpkg -i erlang-solutions_2.0_all.deb && \
    rm erlang-solutions_2.0_all.deb && \
    apt-get update

# Install Erlang
RUN apt-get install -y esl-erlang=1:24.3

# Install RabbitMQ signing key
RUN wget -O- https://www.rabbitmq.com/rabbitmq-release-signing-key.asc | apt-key add -

# Install RabbitMQ
RUN apt-get update && \
    apt-get install -y rabbitmq-server=3.9.15-1

# Enable RabbitMQ management plugin
RUN rabbitmq-plugins enable rabbitmq_management

# Expose RabbitMQ ports
# 5672 is the standard AMQP protocol port
# 15672 is for management plugin access
EXPOSE 5672 15672

# Set default command
CMD ["rabbitmq-server"]
