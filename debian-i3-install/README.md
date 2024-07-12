# Run install.sh

This is a script for setup of debian with i3-wm and other basic packages for minimal setup of debian linux. I run this script after a headless install of debian. I have roughly listed the packages that this script installs.

1. xorg(xserver)
2. i3-wm
3. feh
4. compton
5. network-manager
6. linux headers
7. firmware (that "I" need, feel free to edit the script)
8. dmenu
9. shutter
10. terminator
11. vlc
12. gthumb (image viewer)
13. gcc and g++
14. python3
15. git
16. pipewire, pulseaudio
17. curl
18. htop
19. thunar
20. brave-browser

This script also adds a custom image to the background of GRUB Boot Menu, you can change the image as per you liking by replacing the "www.png" before running the install.sh or after by raplacing the www.png file in /boot/grub and then running sudo update-grub. *If you are changing post install.sh then remember to change the name of the image file in the /etc/default/grub file and then run update-grup*
Same with the wallpaper, either replace the wp.jpg file before running install.sh or change the path in feh --bg-fill <path> at the end of ~/.config/i3/config file.

I use LibreOffice, VS Code and Obsidian, the script will ask your before installing these, and at the end it will ask you before generating ssh keys for github. *You will have to add this keys manually to your GitHub result.*
