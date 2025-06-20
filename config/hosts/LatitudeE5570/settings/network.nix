{ hostname, ... }:
{
  # Setup name
  networking.hostName = hostname;

  # Network Manager
  networking.networkmanager.enable = true;
  networking.wireless.iwd.enable = false;

  # DNS
  services.resolved = {
    enable = false;
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
    enable = false;
    allowedTCPPorts = [ 5555 80 443 ];
    allowedUDPPorts = [ 53 67 68 ];
    allowPing = false;
    checkReversePath = true;
  };

  # nftables
  networking.nftables = {
    enable = false;
    ruleset = ''
      table ip nat {
        chain POSTROUTING {
          type nat hook postrouting priority 100;
          oifname "wlan0" masquerade;
        }
      }
      table ip filter {
        chain FORWARD {
          iifname "waydroid0" oifname "wlan0" accept;
          iifname "wlan0" oifname "waydroid0" ct state related,established accept;
        }
      }
    '';
  };
}
