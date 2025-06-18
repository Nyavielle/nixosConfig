{ user, ... }:
{
  # Audio
  services.pipewire = {
    enable = true;
    alsa.eanble = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Autologin
  services.getty.autologinUser = user;

  # OpenGL
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # SSH
  services.openssh.enable = true;

  # Flatpak
  services.flatpak.enable = true;
}
