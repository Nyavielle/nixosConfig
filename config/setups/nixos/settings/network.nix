{ setname, ... }:
{
  # Setup name
  networking.hostName = setname;

  # Network Manager
  networking.wireless.iwd.enable = true;

  # DNS
  services.resolved = {
    enable = true;
    extraConfig = ''
      DNS=1.1.1.1 1.0.0.1
      FallbackDNS=9.9.9.9
      Domains=~.
      LLMNR=no
      MulticastDNS=no
      DNSSEC=yes
      Cache=yes
      DNSStubListener=yes
      ReadEtcHosts=yes
      DNSOverTLS=yes
    '';
  };

  # Firewall
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 22 ];
    allowedUDPPorts = [];
    allowPing = false;
    checkReversePath = true;
  };
}
