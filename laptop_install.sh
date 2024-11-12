#!bin/bash

# Install reflector
sudo pacman -S reflector

# Create synbolic links
mkdir -p $HOME/.config
mkdir -p $HOME/.cache
ln -s $HOME/Git/dotfiles/config/nvim $HOME/.config/nvim
ln -s $HOME/Git/dotfiles/config/kitty $HOME/.config/kitty
ln -s $HOME/Git/dotfiles/config/catnap $HOME/.config/catnap
ln -s $HOME/Git/dotfiles/config/hypr $HOME/.config/hypr
ln -s $HOME/Git/dotfiles/config/waybar $HOME/.config/waybar
ln -s $HOME/Git/dotfiles/config/rofi $HOME/.config/rofi
ln -s $HOME/Git/dotfiles/config/wal $HOME/.config/wal
ln -s $HOME/Git/dotfiles/config/oomox $HOME/.config/oomox
ln -s $HOME/Git/dotfiles/config/bashrc $HOME/.bashrc

# Setup mirrors with reflector
sudo reflector --sort rate --latest 20 --protocol https --save /etc/pacman.d/mirrorlist

# Update and upgrade packages
sudo pacman -Syu

# Install dependencies and yay on Arch Linux
sudo pacman -S --needed base-devel yay wget curl tmux npm neovim kitty rdesktop openssh nemo grim slurp xdg-desktop-portal-hyprland xdg-desktop-portal xdg-desktop-portal-gtk qt6-wayland qt5-wayland viu pciutils nim gzip pcre usbutils btop grep dunst imagemagick procps python-pip hypridle hyprpaper hyprlock waybar rofi-wayland librewolf

# Install pywal16
pip3 install --user pywal16
pip3 install --user colorz

# Install packages with yay
yay -S catnap-git update-grub themix-full-git

# Install fonts
yay -S ttf-jetbrains-mono-nerd ttf-jetbrains-mono-nerd-italic ttf-jetbrains-mono-nerd-bold ttf-jetbrains-mono-nerd-bold-italic ttf-jetbrains-mono-nerd-fa-brands ttf-jetbrains-mono-nerd-fa-solid
