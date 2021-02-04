#!/bin/env bash

# Criando diretórios
mkdir $HOME/.k4k4rot0-repo
mkdir $HOME/.compile
mkdir $HOME/.config/rofi
mkdir $HOME/.config/rofi/themes
mkdir $HOME/.config/polybar
mkdir $HOME/.config/dunst
mkdir $HOME/.config/i3lock
mkdir $HOME/.fonts
mkdir $HOME/.icons
mkdir $HOME/.local/bin
mkdir $HOME/Wallpapers

# Baixando pacotes
sudo pacman -S git wget dunst simplescreenrecorder aria2 mpv libnotify firefox-i18n-pt-br maim i3lock viewnior python-pip pacman-contrib lxappearance gvfs-mtp xdg-user-dirs pulseaudio-alsa w3m flameshot ttf-jetbrains-mono ttf-fantasque-sans-mono ttf-fira-code zsh zsh-autosuggestions zsh-syntax-highlighting reflector keepassxc redshift ttf-font-awesome jq --noconfirm && xdg-user-dirs-update

# Compilações
# Compilando -> Polybar
cd $HOME/.compile
git clone https://aur.archlinux.org/polybar.git
cd $HOME/.compile/polybar
makepkg -sic --noconfirm

# Compilando -> Pulseaudio-ctl
cd $HOME/.compile
git clone https://aur.archlinux.org/pulseaudio-ctl.git
cd $HOME/.compile/pulseaudio-ctl
makepkg -sic --noconfirm

# Mouse Theme
cd $HOME/.compile
git clone https://github.com/yeyushengfan258/WinSur-white-cursors.git
cd $HOME/.compile/WinSur-white-cursors
sudo ./install.sh

# Limpar console
clear

# Clonando meu repositório
cd $HOME/.k4k4rot0-repo
git clone https://github.com/k4k4rot0/dotfiles.git

# Criando o dir ~/.local/bin e dando permissões aos scripts
cp $HOME/.k4krot0-repo/dotfiles/bin/* $HOME/.local/bin
cd $HOME/.local/bin && chmod +x *

# Copiando as fontes para o sistema
cp $HOME/.k4k4rot0-repo/dotfiles/.fonts/* $HOME/.fonts

# Aplicando tema
# i3
cp $HOME/.k4k4rot0-repo/dotfiles/.config/i3/config $HOME/.config/i3/

# Polybar
cp -r $HOME/.k4k4rot0-repo/dotfiles/.config/polybar/scripts $HOME/.config/polybar
cp $HOME/.k4k4rot0-repo/dotfiles/.config/polybar/config $HOME/.config/polybar
chmod +x $HOME/.config/polybar/scripts/*

# Rofi
sudo pacman -S rofi --noconfirm
cp $HOME/.k4k4rot0-repo/dotfiles/.config/rofi/arch.rasi $HOME/.config/rofi/
cp $HOME/.k4k4rot0-repo/dotfiles/.config/rofi/themes/arch.rasi $HOME/.config/rofi/themes/

# DUNST
cp $HOME/.k4k4rot0-repo/dotfiles/.config/dunst/dunstrc $HOME/.config/dunst

# NITROGEN
sudo pacman -S nitrogen --noconfirm
cd $HOME/Wallpapers
wget -c https://github.com/k4k4rot0/dotfiles/blob/main/wallpaper/wallpaper.jpg
nitrogen --set-auto $HOME/Wallpapers/wallpaper.png
i3-msg restart
