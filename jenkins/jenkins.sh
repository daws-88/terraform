#!/bin/bash

## increase disk volume
growpart /dev/nvme0n1 4
lvextend -L +20G /dev/mapper/RootVG-homeVol
xfs_growfs /home

lvextend -L +10G /dev/mapper/RootVG-rootVol
xfs_growfs /

## install java
dnf install fontconfig java-21-openjdk -y