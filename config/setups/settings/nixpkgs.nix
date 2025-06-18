{
  nix.settings.experimental-features = [ "nix-community" "flakes" ];
  nixpkgs.config.allowUnfree = true;
}
