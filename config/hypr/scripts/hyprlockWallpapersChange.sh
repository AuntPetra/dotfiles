#!/bin/bash

#Request wallpaper paths

read -p "Main display wallpaper path: " wallpaper1 
read -p "Side display wallpaper path: " wallpaper2


#Use wal to refresh $HOME/.cache/wal/colors-hyprland.conf

wal -i $wallpaper1 -n


#Copy colors-hyprland.conf to static file $HOME/.config/hypr/config/colors-hyprlock.conf and remove old color configuration

rm -f $HOME/.config/hypr/config/colors-hyprlock.conf
cp $HOME/.cache/wal/colors-hyprland.conf $HOME/.config/hypr/config/colors-hyprlock.conf


#Add wallpaperpaths to static file

bash -c "echo '$''${!wallpaper1@} = '$wallpaper1 >> $HOME/.config/hypr/config/colors-hyprlock.conf"
bash -c "echo '$''${!wallpaper2@} = '$wallpaper2 >> $HOME/.config/hypr/config/colors-hyprlock.conf"
