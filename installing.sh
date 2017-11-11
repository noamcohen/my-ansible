#!/bin/bash
sudo apt-get install -y ansible openssh-server


cat << EOF
[local]
127.0.0.1
EOF > /tmp/x
sudo mv /tmp/x /etc/ansible/hosts



run
ansible-playbook basic.yml --ask-sudo-pass

