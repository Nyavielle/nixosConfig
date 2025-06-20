{ pkgs, ... }:
{
  home.packages = with pkgs;
  [
    # Desktop programs
    alacritty
    bitwarden-desktop
    discord
    firefox
    mpv
    obsidian
    spotify
    steam
    telegram-desktop
    zathura

    # Terminal utils
    btop
    curl
    docker
    git
    htop
    neofetch
    neovim
    ranger
    starship
    tree
    unzip
    wget
    yt-dlp
    zip

    # Desktop environment
    brightnessctl
    grim
    hyprland
    hyprlock
    hypridle
    hyprpaper
    playerctl
    slurp
    waybar
    wofi

    # Compilers
    python3Full
    clang
    cargo
    nodejs
    openjdk21
  ];
}
