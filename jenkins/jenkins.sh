#!/bin/bash

## increase disk volume
growpart /dev/nvme0n1 4
lvextend -L +20G /dev/mapper/RootVG-rootVol
lvextend -L +20G /dev/mapper/RootVG-homeVol
lvextend -L +20G /dev/mapper/RootVG-varVol
xfs_growfs /
xfs_growfs /var
xfs_growfs /home

## install java
dnf install fontconfig java-21-openjdk -y
rm -f /etc/yum.repos.d/jenkins.repo
curl -fsSL -o /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/rpm-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2026.key

dnf clean all
dnf makecache
dnf install jenkins -y
systemctl daemon-reload
systemctl start jenkins
