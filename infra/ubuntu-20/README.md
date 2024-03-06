docker build -t my-ubuntu-image .

docker run -it my-ubuntu-image


# on ec2 
1. install rabbit mq
run install-ubuntu-jammy.sh

2. install dashboard
sudo rabbitmq-plugins enable rabbitmq_management

3. restart rabbitmq 
sudo systemctl restart rabbitmq-server

urls http://13.53.197.44:15672/

4. local user is
guest
guest

5. add user

sudo rabbitmqctl add_user myuser mypassword
sudo rabbitmqctl add_user ylaksun London44*.

6. add permissions

rabbitmqctl help set_permissions

sudo rabbitmqctl set_user_tags myuser administrator

sudo rabbitmqctl set_user_tags ylaksun administrator



