#!/bin/bash

sudo cp www.png /boot/grub/
sudo cp grub /etc/default/
sudo update-grub
