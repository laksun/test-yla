To install RabbitMQ on an EC2 instance on AWS and create a GitLab pipeline for automation, follow these steps:

### Part 1: Installing RabbitMQ on an EC2 Instance

#### Step 1: Launch an EC2 Instance

1. Log in to the AWS Management Console.
2. Navigate to the EC2 Dashboard and launch a new instance.
3. Choose an Amazon Linux 2 AMI or Ubuntu Server AMI.
4. Select an instance type (e.g., `t2.micro` for testing).
5. Configure instance details as needed.
6. Add storage if the default is insufficient.
7. Configure the security group to allow access on the required ports:
   - SSH (22)
   - RabbitMQ web management console (15672, optional)
   - RabbitMQ default port (5672)
8. Review and launch the instance.

#### Step 2: Connect to Your Instance

Use SSH to connect to your instance:

```bash
ssh -i /path/to/your/key.pem ec2-user@your_instance_public_dns
```

Replace `/path/to/your/key.pem` with your key path and `your_instance_public_dns` with your instance's public DNS.

#### Step 3: Install RabbitMQ

On Amazon Linux 2:

```bash
sudo yum update -y
sudo yum install -y erlang
sudo rpm --import https://packages.erlang-solutions.com/rpm/erlang_solutions.asc
sudo yum install -y https://github.com/rabbitmq/rabbitmq-server/releases/download/v3.8.9/rabbitmq-server-3.8.9-1.el7.noarch.rpm
sudo systemctl enable rabbitmq-server
sudo systemctl start rabbitmq-server
```

On Ubuntu:

```bash
sudo apt-get update
sudo apt-get install -y erlang
sudo apt-get install -y rabbitmq-server
sudo systemctl enable rabbitmq-server
sudo systemctl start rabbitmq-server
```

#### Step 4: Enable RabbitMQ Management Plugin (Optional)

```bash
sudo rabbitmq-plugins enable rabbitmq_management
```

### Part 2: Creating a GitLab CI/CD Pipeline

#### Step 1: Define the Pipeline in `.gitlab-ci.yml`

Create a `.gitlab-ci.yml` file in the root of your GitLab repository with the following content to automate the deployment:

```yaml
stages:
  - deploy

deploy_rabbitmq:
  stage: deploy
  script:
    - echo "Deploying RabbitMQ to EC2..."
    - ssh -o StrictHostKeyChecking=no -i /path/to/your/key.pem ec2-user@your_instance_public_dns 'bash -s' < deploy_rabbitmq.sh
  only:
    - master
```

#### Step 2: Create the Deployment Script `deploy_rabbitmq.sh`

Create a script named `deploy_rabbitmq.sh` in your repository. This script should include the installation commands based on your EC2's OS (refer to the installation steps above).

#### Step 3: Set Up SSH Key and Host

1. Store your private key (`key.pem`) in GitLab CI/CD Variables as a File type variable (e.g., `SSH_PRIVATE_KEY`).
2. Adjust the pipeline script to use this variable.

```yaml
script:
  - eval $(ssh-agent -s)
  - ssh-add <(echo "$SSH_PRIVATE_KEY")
  - ssh -o StrictHostKeyChecking=no ec2-user@your_instance_public_dns 'bash -s' < deploy_rabbitmq.sh
```

#### Important Considerations:

- **Security**: Be cautious with your SSH keys and sensitive data. Use GitLab's protected variables for sensitive information.
- **Idempotence**: Ensure your `deploy_rabbitmq.sh` script is idempotent (running it multiple times doesn't change the result beyond the initial application).
- **SSH Access**: Your GitLab runner must have network access to your EC2 instance. This may require adjustments in your security group settings.

This GitLab pipeline provides a basic example. Depending on your project's complexity, you might need to adjust or extend the pipeline and scripts.