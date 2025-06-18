{
  programs.hyprland.enable = true;

  programs.starship.enable = true;

  programs.zsh = {
    enable = true;
    shellInit = ''
      eval "$(starship init zsh)"
      [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec Hyprland
    '';
  };
}
