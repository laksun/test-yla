# Use Ubuntu 20.04 LTS as the base image
FROM ubuntu:20.04

# Prevent apt from asking questions when installing packages
FROM ubuntu:20.04

# Update package lists
RUN apt-get update -y

# Install basic utilities
RUN apt-get install -y --no-install-recommends \
    build-essential \
    ca-certificates \
    curl \
    git \
    jq \
    locales \
    net-tools \
    openssh-server \
    sudo \
    tar \
    unzip \
    wget

# Set locale to English (US)
RUN locale-gen en_US.UTF-8

# Clean up
RUN apt-get autoremove -y
RUN rm -rf /var/lib/apt/lists/*

# Set the default command to bash to enter interactive mode by default
CMD ["/bin/bash"]
