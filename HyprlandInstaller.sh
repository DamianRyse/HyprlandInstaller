#!/bin/bash

# Check if pacman is available
if ! command -v pacman > /dev/null 2>&1; then
  echo "Warning: Pacman is not available on this system."
  exit 1
fi

# Check if script is run as root
if [ "$EUID" -ne 0 ]; then
    echo "Warning: This script must be run as root."
    exit 1
fi

# Get the system up2date
echo "Performing system update"
pacman -Syu -y

# Install the basic components
echo "Installing linux-headers"
pacman -S linux-headers -y

echo "Installing Hyprland"
pacman -S hyprland -y

echo "Installing utilities"
pacman -S cifs-utils gvfs dunst libva nvidia-dkms obsidian pavucontrol pipewire pulseaudio qt6-wayland qt6ct rofi unzip usbutils waybar wget wireplumber xdg-desktop-portal xdg-desktop-portal-wlr zsh swwww alacritty kitty dolphin rofi btop  mpv git base-devel

# Install yay
echo "Installing yay"
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si


