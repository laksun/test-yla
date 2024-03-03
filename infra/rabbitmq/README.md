# Access the RabbitMQ Admin Dashboard

After enabling the RabbitMQ Management Plugin and configuring the security group, you can access the RabbitMQ admin dashboard by navigating to http://your_ec2_instance_public_ip:15672/ in a web browser. The default login credentials are:

    Username: guest
    Password: guest



 git filter-branch --force --index-filter \
  "git rm --cached --ignore-unmatch infra/rabbitmq/.terraform/providers/registry.terraform.io/hashicorp/aws/5.39.0/darwin_arm64/terraform-provider-aws_v5.39.0_x5" \
  --prune-empty --tag-name-filter cat -- --all   

  git push origin --force --all
git add .gitignore # or .gitattributes if you've used git lfs track
git commit -m "Configure .gitignore and .gitattributes for large files"
git push origin main

RabbitMQ

1. java error
2. erlang error

cd /tmp
wget https://corretto.aws/downloads/latest/amazon-corretto-8-x64-linux-jdk.rpm
sudo yum install -y amazon-corretto-8-x64-linux-jdk.rpm

sudo yum install -y gcc gcc-c++ glibc-devel make ncurses-devel openssl-devel autoconf  git

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.0
echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.bashrc
echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc
source ~/.bashrc

asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git

asdf install erlang 26.0
asdf global erlang 26.0

wget https://github.com/rabbitmq/rabbitmq-server/releases/download/v3.8.9/rabbitmq-server-3.8.9-1.el7.noarch.rpm
sudo rpm --import https://www.rabbitmq.com/rabbitmq-release-signing-key.asc
sudo rpm -Uvh rabbitmq-server-3.8.9-1.el7.noarch.rpm

sudo rpm --import 'https://github.com/rabbitmq/signing-keys/releases/download/3.0/cloudsmith.rabbitmq-erlang.E495BB49CC4BBE5B.key'
sudo rpm --import https://github.com/rabbitmq/signing-keys/releases/download/3.0/rabbitmq-release-signing-key.asc
sudo dnf install socat logrotate -y

wget https://github.com/rabbitmq/rabbitmq-server/releases/download/v3.13.0/rabbitmq-server-3.13.0-1.el8.noarch.rpm
sudo dnf install rabbitmq-server-3.13.0-1.el8.noarch.rpm


