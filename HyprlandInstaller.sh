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
sudo pacman -S --needed --noconfirm linux-headers

echo "Installing Hyprland"
sudo pacman -S --needed --noconfirm hyprland

echo "Installing utilities"
sudo pacman -S --needed --noconfirm wget cifs-utils gvfs dunst libva nvidia-dkms obsidian pavucontrol pipewire pulseaudio qt6-wayland qt6ct rofi unzip usbutils waybar wget wireplumber xdg-desktop-portal xdg-desktop-portal-wlr zsh swww alacritty kitty dolphin rofi btop  mpv git base-devel

# Install yay
echo "Installing yay"
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

wget -O ~/.config/hypr/hyprland.conf https://raw.githubusercontent.com/DamianRyse/HyprlandInstaller/refs/heads/main/dotfiles/hyprland.conf
mkdir -p ~/.config/swaylock
mkdir -p ~/.config/waybar
wget -O ~/.config/swaylock/config  https://raw.githubusercontent.com/DamianRyse/HyprlandInstaller/refs/heads/main/dotfiles/swaylock_config
wget -O ~/.config/waybar/config  https://raw.githubusercontent.com/DamianRyse/HyprlandInstaller/refs/heads/main/dotfiles/waybar/config
wget -O ~/.config/waybar/frappe.css  https://raw.githubusercontent.com/DamianRyse/HyprlandInstaller/refs/heads/main/dotfiles/waybar/frappe.css
wget -O ~/.config/waybar/style.css  https://raw.githubusercontent.com/DamianRyse/HyprlandInstaller/refs/heads/main/dotfiles/waybar/style.css
