#!/bin/bash

sudo cp sources.list /etc/apt/
sudo apt-get update -yq
sudo apt-get upgrade -yq
sudo apt-get install -yq linux-headers-6.1.0-22-amd64 firmware-* network-manager xorg i3-wm dmenu shutter terminator vlc gthumb feh nano gcc g++ python3 git pipewire compton pulseaudio curl htop iw neofetch thunar
mkdir ~/.config/
cp -r dotconfig/* ~/.config/
cp wp.jpg ~/.config/
sudo cp www.png /boot/grub/
sudo cp Noto* /usr/share/fonts/truetype/noto/

sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt-get -yq update
sudo apt-get install -yq brave-browser

sudo cp grub /etc/default/
sudo update-grub


echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e "Do you want to install LibreOffice, Obsidian and VSCode? y/n"
read answer
if [ "$answer" = "y" ]; then
    sudo apt-get -yq install libreoffice
    sudo dpkg -i obsidian*
    sudo dpkg -i code*
elif [ "$answer" = "n" ]; then
    echo "Moving On"
else
    echo "Invalid input. Please enter 'y' or 'n'."
fi

cp .xinitrd ~/
git config --global user.name "The Creative Spark"
git config --global user.email "jnani@duck.com"

echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e "Pending:"
echo -e "1. Brave Customization"
echo -e "2. VS-Code Login"
echo -e "3. SSH KeyGen"
echo -e "4. Add SSH-Keys to GitHub"
echo -e "Do you want to create SSH-Keys? y/n"
read answer
if [ "$answer" = "y" ]; then
    echo "Generating SSH-Keys"
    ssh-keygen
    echo "SSH keys are generated add then to your GitHub"
    sleep 3
    exit
elif [ "$answer" = "n" ]; then
    echo "Installation Complete"
    sleep 1
    exit
else
    echo "Invalid input. Please enter 'y' or 'n'."
fi
exit
