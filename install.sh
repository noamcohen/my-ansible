#!/bin/bash
set -e

# this script is to be run from the my-ansible directory

sudo apt-get install -y ansible openssh-server git

# after installing ansible:
sudo ansible-galaxy install theNewFlesh.sublime
sudo ansible-galaxy install henriklynggaard.clion
sudo ansible-galaxy install gantsign.gitkraken
sudo ansible-galaxy install wtanaka.slack
sudo ansible-galaxy install wtanaka.chrome
sudo ansible-galaxy install igor_mukhin.backintime

printf "[local]\n127.0.0.1\n" | sudo tee -a  /etc/ansible/hosts

# prepare ssh key
ssh-keygen
ssh-copy-id localhost

# for some reason the dir is created as root. make it mine
sudo chown -R $USER ~/.ansible

#git clone git@github.com:noamcohen/my-ansible.git
#cd my-ansible
ansible-playbook basic.yml --ask-sudo-pass


# install git-lfs
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
sudo apt-get install git-lfs
git lfs install

cd ~
git clone https://github.com/lifeonairteam/secrets ~/.password-store