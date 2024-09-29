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
sudo pacman -S --needed --noconfirm wget cifs-utils gvfs dunst libva nvidia-dkms obsidian pavucontrol pipewire pulseaudio qt6-wayland qt6ct rofi unzip usbutils waybar wget wireplumber xdg-desktop-portal xdg-desktop-portal-wlr zsh swww alacritty kitty dolphin rofi btop  mpv git base-devel noto-fonts noto-fonts-cjk noto-fonts-emoji gnu-free-fonts ttf-jetbrains-mono-nerd

# Install yay
echo "Installing yay"
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ~

# Clone the repository and start copying the dotfiles
git clone https://github.com/DamianRyse/HyprlandInstaller.git

# Create the .config directories
mkdir -p ~/.config/hypr    # Should be created automatically by the installation
mkdir -p ~/.config/swaylock

cp HyprlandInstaller/dotfiles/hyprland.conf ~/.config/hypr/
cp HyprlandInstaller/dotfiles/swaylock_config ~/.config/swaylock/config
cp -r HyprlandInstaller/dotfiles/rofi ~/.config/
cp -r HyprlandInstaller/dotfiles/qt6ct ~/.config/
cp -r HyprlandInstaller/dotfiles/alacritty ~/.config/
