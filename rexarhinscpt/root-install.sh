#!/bin/bash

pacman -Syu
pacman -S nano sudo git ufw networkmanager base-devel

systemctl enable systemd-journald
systemctl enable NetworkManager
ufw enable

echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
touch /etc/locale.conf
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
touch /etc/vconsole.conf
echo "KEYMAP=us" >> /etc/vconsole.conf


bash systemd-install.sh


read -p "Enter the new hostname: " hname
echo "$hname" |  tee -a /etc/hostname

echo "Enter Root Password:"
passwd

ln -sf /usr/share/zoneinfo/Asia/Calcutta /etc/localtime
hwclock --systohc

systemctl enable systemd-timesyncd

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
