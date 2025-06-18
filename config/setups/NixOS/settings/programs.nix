{
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };

  programs.starship.enable = true;

  programs.zsh = {
    enable = true;
    shellInit = ''
      eval "$(starship init zsh)"
    '';
  };
}
