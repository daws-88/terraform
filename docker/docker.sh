#!/bin/bash
## clone dockerfile repo
cd /home/ec2-user
git clone https://github.com/daws-88/dockerfiles.git
git clone https://github.com/daws-88/docker-roboshop.git
chown -R ec2-user:ec2-user dockerfiles
chown -R ec2-user:ec2-user docker-roboshop

## increase disk volume
growpart /dev/nvme0n1 4
lvextend -L +30G /dev/mapper/RootVG-varVol
xfs_growfs /var

## install docker
dnf -y install dnf-plugins-core
dnf config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo
dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
systemctl daemon-reload
sudo systemctl enable --now docker
sleep 10
systemctl start docker