#!/bin/bash

echo "This script assumes that you have already created a new user other than root and executing this script as that user."

sleep 5

sudo pacman -Syu
sudo pacman -S nano sudo git ufw networkmanager base-devel

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

sudo systemctl enable systemd-journald
sudo systemctl enable NetworkManager
sudo ufw enable

sudo ln -sf /usr/share/zoneinfo/Asia/Calcutta /etc/localtime
sudo hwclock --systohc

sudo systemctl enable systemd-timesyncd

read -p "Do you want to Setup CUPS? (y/n): " uin
uin=$(echo "$uin" | tr '[:upper:]' '[:lower:]')
if [ "$uin" = "y" ]; then
  sudo pacman -Syu cups
  sudo systemctl enable cups.service
  sudo systemctl start cups.service  
  echo "CUPS has been installed and started."
else
  echo "CUPS setup skipped."
fi

read -p "Do you want to Setup Desktop? (y/n): " uin
uin=$(echo "$uin" | tr '[:upper:]' '[:lower:]')
if [ "$uin" = "y" ]; then
  sudo pacman -Syu xorg xorg-xinit i3 feh gcc g++ python3 pulseaudio curl htop neofetch thunar pipewire vlc lightdm-gtk-greeter firefox alsa-utils alsamixer i3status dmenu
  sudo systemctl enable lightdm
  sudo systemctl enable --now pulseaudio
  touch ~/.xinitrc
  echo "exec i3" >> ~/.xinitrc
  mkdir ~/.config/
  cp -r dotconfig/* ~/.config/
  cp wp.jpg ~/.config/
  sudo cp Noto* /usr/share/fonts/
else
  echo "Minimal Install"
fi

read -p "Do you want to Setup Bluetooth? (y/n): " uin
uin=$(echo "$uin" | tr '[:upper:]' '[:lower:]')
if [ "$uin" = "y" ]; then
  sudo pacman -S bluez bluez-utils
  sudo systemctl enable bluetooth
else
  echo "No Bluetooth"
fi


echo "WARNING"
echo "WARNING"
echo "WARNING"
echo "CHANGE THE UUID IN arch.conf"
echo "WARNING"
echo "WARNING"
echo "WARNING"


exit 0
