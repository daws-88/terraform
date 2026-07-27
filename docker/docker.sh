#!/bin/bash
## clone dockerfile repo
cd /home/ec2-user
git clone https://github.com/daws-88/eksctl.git
git clone https://github.com/daws-88/dockerfiles.git
git clone https://github.com/daws-88/docker-roboshop.git
chown -R ec2-user:ec2-user eksctl
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
usermod -aG docker ec2-user

# install kubectl

curl -LO "https://s3.us-west-2.amazonaws.com/amazon-eks/1.35.3/2026-04-08/bin/linux/amd64/kubectl"
chmod +x kubectl
cp kubectl /usr/local/bin/

## eksctl install
ARCH=amd64
PLATFORM=$(uname -s)_$ARCH
ARCH=amd64
PLATFORM=$(uname -s)_$ARCH
curl -sLO "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_$PLATFORM.tar.gz"
tar -xzf eksctl_$PLATFORM.tar.gz -C /tmp && rm eksctl_$PLATFORM.tar.gz
install -m 0755 /tmp/eksctl /usr/local/bin && rm /tmp/eksctl

### kubens install
 
curl -LO https://github.com/ahmetb/kubectx/releases/latest/download/kubens
chmod +x kubens
mv kubens /usr/local/bin/
