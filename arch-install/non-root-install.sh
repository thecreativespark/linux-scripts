#!/bin/bash

echo "This script assumes that you have already created a new user other than root and executing this script as that user."

read -p "Do you want to Setup CUPS? This might be required to add printer. (y/n): " uin
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
  sudo pacman -Syu xorg xorg-xinit i3 feh gcc python3 pulseaudio curl htop neofetch thunar pipewire vlc lxdm firefox alsa-utils i3status dmenu terminator lxdm
  sudo systemctl enable lxdm
  sudo systemctl enable pipewire
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

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg PKGBUILD

echo "WARNING"
echo "yay install required"

exit 0
