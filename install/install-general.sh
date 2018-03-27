#!/bin/bash

# Install all packages
sudo pacman -S wget unzip tar git pulseaudio pulseaudio-alsa  xorg xorg-xinit plasma-desktop konsole dolphin kate iceweasel iceweasel-l10n-nl icedove icedove-enigmail icedove-l10n-nl bash-completion sddm aspell-nl enchant gst-libav gst-plugins-good hunspell-nl icedtea-web jre8-openjdk languagetool libmythes mythes-nl kscreen ttf-dejavu ttf-droid ttf-gentium ttf-liberation breeze-gtk breeze-kde4 kde-gtk-config kdeplasma-addons  plasma-pa ark kinfocenter kwalletmanager gwenview kipi-plugins gimp spectacle libreoffice-fresh okular amarok vlc speedcrunch redshift plasma5-applets-redshift-control digikam kcolorchooser kruler kompare kfind ktorrent ufw networkmanager plasma-nm bluez bluez-utils kdeconnect xsane libreoffice-fresh libreoffice-fresh-nl openssh

# Create startup file
echo “exec startkde” > ~/.xinitrc

# Enable sddm
sudo systemctl enable sddm
sudo sed -i -e 's/Current=/Current=breeze/g' /usr/lib/sddm/sddm.conf.d/sddm.conf

# Enable networkmanager
sudo systemctl stop dhcpcd
sudo systemctl disable dhcpcd
sudo systemctl enable NetworkManager
sudo systemctl start NetworkManager

# Enable firewall
sudo uf enable
sudo systemctl enable ufw.service

# Configure git
git config --global user.email "adem@aytacworld.com"
git config --global user.name "Adem Aytaç"

# Remove orphans & optimize pacman
sudo pacman -Rns $(pacman -Qtdq)
sudo pacman-optimize
