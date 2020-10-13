## Ansible user setup
# Here we create a new user that will run ansible and docker images
sudo adduser --disabled-password --gecos "" ansible-user
sudo groupadd docker
sudo usermod -aG docker,sudo ansible-user
sudo su ansible

## Install pip and ansible
sudp apt update
sudo apt upgrade
sudo apt install python3-pip ansible -y

## Install the python docker module. Make sure that you install either docker or docker.py. Do not install bot
sudo pip3 install docker
pip3 install docker