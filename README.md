# nixosConfig

## About this configuration:

This is my personal NixOS setup built with flakes for clean, reproducible, and flexible system management.
It's designed for a smooth daily workflow:
- Declarative system configuration, so every change is tracked and reversible
- Home Manager integration to keep my user environment tidy and consistent
- Custom Hyprland Wayland compositor setup for slick window management
- Starship prompt tuned for clarity and style in my terminal
- Alacritty terminal configured with hacker-green theme and nerd fonts for ultimate comfort
- Essential tools and apps preinstalled to jump right into coding and gaming


## How to install it?:

### If you use NixOS already:
```bash
git clone https://github.com/Nyavielle/nixosConfig
cd nixosConfig/config
rm -rf ./setups/NixOS/settings/hardware-configuration.nix
sudo cp /etc/nixos/hardware-configuration.nix ./setups/NixOS/settings/hardware-configuration.nix
sudo nixos-rebuild switch --flake .#NixOS
reboot
```

### If you install NixOS:
```bash
sudo -i
git clone https://github.com/Nyavielle/nixosConfig
cd nixosConfig/config
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode destroy,format,mount ./setups/NixOS/settings/disko.nix
sudo nixos-generate-config --root /mnt
rm -rf ./setups/NixOS/settings/hardware-configuration.nix
sudo cp /mnt/etc/nixos/hardware-configuration.nix ./setups/NixOS/settings/hardware-configuration.nix
sudo nixos-install --flake .#NixOS
reboot
```
