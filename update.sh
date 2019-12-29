#!/bin/bash

DOT=~/myI3Config
DOTCONF=$DOT/.config
I3WM=~/.config/i3
GTK3=~/.config/gtk-3.0
RANG=~/.config/ranger
TERM=~/.config/elokab
QOB=~/.config/qobbar
echo Home files
cp -f ~/.Xresources $DOT/.Xresources 
cp -f ~/.zshrc $DOT/.zshrc 
cp -f ~/.profile $DOT/.profile
cp -f ~/.gtkrc-2.0 $DOT/.gtkrc-2.0

echo Mpd
mkdir -p $DOT/.mpd 
cp -f ~/.mpd/mpd.conf $DOT/.mpd/mpd.conf

echo Bin files
mkdir -p $DOT/.local/bin
cp  -f ~/.local/bin/* $DOT/.local/bin/

echo Ncmpcpp
mkdir -p $DOT/.ncmpcpp
cp -f ~/.ncmpcpp/config  $DOT/.ncmpcpp/config

echo i3wm
mkdir -p $DOTCONF/i3
cp -f $I3WM/config $DOTCONF/i3/config
cp -f $I3WM/i3blocks.conf $DOTCONF/i3/i3blocks.conf
cp -f $I3WM/i3status.conf $DOTCONF/i3/i3status.conf

echo Gtk3
mkdir -p $DOTCONF/gtk-3.0
cp -f  $GTK3/settings.ini $DOTCONF/gtk-3.0/settings.ini
cp -f  $GTK3/gtk.css  $DOTCONF/gtk-3.0/gtk.css

echo Ranger
mkdir -p $DOTCONF/ranger/plugins/ranger_devicons
cp -f  $RANG/rc.conf $DOTCONF/ranger/rc.conf
cp -f  $RANG/scope.sh $DOTCONF/ranger/scope.sh
cp -f  $RANG/plugins/ranger_devicons/devicons.py  $DOTCONF/ranger/plugins/ranger_devicons/devicons.py
cp -f  $RANG/plugins/ranger_devicons/devicons_linemode.py  $DOTCONF/ranger/plugins/ranger_devicons/devicons_linemode.py

echo Elokab-terminal
mkdir -p $DOTCONF/elokab
cp -f $TERM/elokab-terminal.conf  $DOT/.config/elokab

echo Qobbar
mkdir -p $DOTCONF/qobbar
cp -f $QOB/greenbar.conf  $DOT/.config/qobbar


echo Git Add

git add .mpd/*
git add .ncmpcpp/*
git add .local/bin/*
git add .config/i3/*
git add .config/gtk-3.0/*
git add .config/ranger/*
git add .config/ranger/plugins/ranger_devicons/*
git add .config/elokab/*
git add .config/qobbar/*
git add .Xresources
git add .gtkrc-2.0
git add .profile
git add .zshrc
git add update.sh
 
#git commit  "last dotefiles"

#git  push https://github.com/zakariakov/myI3Config.gi
