#!/bin/bash

sudo apt-get install -y crul
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave->
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ >
sudo apt-get -yq update
sudo apt-get install -yq brave-browser
