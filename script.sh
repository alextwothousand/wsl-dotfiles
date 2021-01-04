#!/bin/bash

# Modify your user account name here. This is just the one I use.
USER="alex"

# install sudo and others if not installed already
pacman -S sudo zsh curl base-devel git --needed --noconfirm

# add wheel group to /etc/sudoers
printf "%swheel  ALL=(ALL)       ALL" "%" >> /etc/sudoers

# create new user and set perms
useradd -m ${USER}
chown -R ${USER} /home/${USER}
usermod -aG wheel ${USER}

# switch to new user
su - ${USER}

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install paru, an AUR wrapper
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si --needed --noconfirm
cd ..

# complete!
printf "My work here is done. Thanks for using my script :)"
