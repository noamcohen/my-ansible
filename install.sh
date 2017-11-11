#!/bin/bash
set -e

sudo apt-get install -y ansible openssh-server git

# after installing ansible:
sudo ansible-galaxy install theNewFlesh.sublime
sudo ansible-galaxy install henriklynggaard.clion
sudo ansible-galaxy install theNewFlesh.sublime


sudo printf "[local]\n127.0.0.1\n" >> /etc/ansible/hosts

git clone git@github.com:noamcohen/my-ansible.git
cd my-ansible
ansible-playbook basic.yml --ask-sudo-pass

