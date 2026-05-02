#!/bin/bash

set -e

echo "=== Updating system ==="
sudo apt update && sudo apt upgrade -y

echo "=== Installing core GNOME tools ==="
sudo apt install -y gnome-tweaks gnome-shell-extensions gnome-shell-extension-manager chrome-gnome-shell

echo "=== Installing UI extensions ==="
sudo apt install -y gnome-shell-extension-dash-to-dock gnome-shell-extension-appindicator gnome-shell-extension-desktop-icons-ng

echo "=== Installing essential software ==="
sudo apt install -y libreoffice vlc gimp inkscape kdenlive obs-studio audacity blender git curl build-essential filezilla

echo "=== Installing Flatpak ==="
sudo apt install -y flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "=== Installing popular apps via Flatpak ==="
flatpak install -y flathub com.spotify.Client org.telegram.desktop com.discordapp.Discord

echo "=== Installing themes ==="
cd ~
git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git || true
cd WhiteSur-gtk-theme
./install.sh || true

cd ~
git clone https://github.com/vinceliuice/Tela-icon-theme.git || true
cd Tela-icon-theme
./install.sh || true

echo "=== Installing fonts ==="
sudo apt install -y fonts-cantarell fonts-roboto fonts-firacode

echo "=== Cleaning up ==="
sudo apt autoremove -y

echo "====================================="
echo "DONE ✅"
echo "Now do this manually:"
echo "1. Open 'Extensions' and enable:"
echo "   - Dash to Dock"
echo "   - AppIndicator"
echo "   - Desktop Icons NG"
echo "2. Open 'GNOME Tweaks':"
echo "   - Set WhiteSur theme"
echo "   - Set Tela icons"
echo "   - Move dock to bottom"
echo "3. (Optional) Install Arc Menu from Extension Manager"
echo "====================================="
