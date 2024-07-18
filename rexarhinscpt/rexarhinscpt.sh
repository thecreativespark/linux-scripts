#!/bin/bash

sudo pacman -Syu
sudo pacman -S nano sudo git ufw networkmanager base-devel

sudo systemctl enable systemd-journald
sudo systemctl enable NetworkManager
sudo ufw enable

sudo echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
sudo locale-gen
sudo touch /etc/locale.conf
sudo echo "LANG=en_US.UTF-8" >> /etc/locale.conf
sudo touch /etc/vconsole.conf
sudo echo "KEYMAP=us" >> /etc/vconsole.conf


sudo bash systemd-install.sh


read -p "Enter the new hostname: " hname
echo "$hname" | sudo tee -a /etc/hostname

echo "Enter Root Password:"
passwd

sudo ln -sf /usr/share/zoneinfo/Asia/Calcutta /etc/localtime
sudo hwclock --systohc

sudo systemctl enable systemd-timesyncd

read -p "Enter username: " uname
useradd -m $uname
passwd $uname

echo "WARNING"
echo "WARNING"
echo "WARNING"
echo "CHANGE THE UUID IN arch.conf"
echo "WARNING"
echo "WARNING"
echo "WARNING"


exit 0
