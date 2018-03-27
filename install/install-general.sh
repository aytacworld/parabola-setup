#!/bin/bash

# Download wget, unzip, tar
sudo pacman -S wget unzip tar

# Download and configure git
sudo pacman -S git
git config --global user.email "adem@aytacworld.com"
git config --global user.name "Adem Aytaç"

# Download browser and mail client
sudo pacman -S iceweasel iceweasel-nl icedove icedove-enigmail icedove-nl

# Download libreoffice
sudo pacman -S libreoffice-fresh libreoffice-fresh-nl
