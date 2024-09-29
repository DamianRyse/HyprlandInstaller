#!/bin/bash

# Check if pacman is available
if ! command -v pacman > /dev/null 2>&1; then
  echo "Warning: Pacman is not available on this system."
  exit 1
fi

# Check if script is run as root
if [ "$EUID" -eq 0 ]; then
    echo "Warning: This script must NOT be run as root."
    exit 1
fi

# Get the system up2date
echo "Performing system update"
sudo pacman -Syu --noconfirm

# Install the basic components
echo "Installing linux-headers"
sudo pacman -S --noconfirm linux-headers

echo "Installing Hyprland"
sudo pacman -S --noconfirm hyprland

echo "Installing utilities"
sudo pacman -S --noconfirm wget cifs-utils gvfs dunst libva nvidia-dkms obsidian pavucontrol pipewire pulseaudio qt6-wayland qt6ct rofi unzip usbutils waybar wget wireplumber xdg-desktop-portal xdg-desktop-portal-wlr zsh swwww alacritty kitty dolphin rofi btop  mpv git base-devel

# Install yay
echo "Installing yay"
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si


