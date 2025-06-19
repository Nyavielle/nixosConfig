{
  disko.devices = {
    disk = {
      main = {
        type = "disk";
        device = "/dev/nvme0n1";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              size = "512M";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [ "umask=0077" ];
              };
            };
            luks = {
              size = "100%";
              content = {
                type = "luks";
                name = "crypted";
                settings = {
                  allowDiscards = true;
                };
                content = {
                  type = "btrfs";
                  extraArgs = [ "-f" ];
                  subvolumes = {
                    "/root" = {
                      mountpoint = "/";
                      mountOptions = [
                        "space_cache=v2"
                        "compress=zstd"
                        "discard=async"
                        "noautodefrag"
                        "noatime"
                        "ssd"
                      ];
                    };
                    "/swap" = {
                      mountpoint = "/.swapvol";
                      mountOptions = [
                        "space_cache=v2"
                        "discard=async"
                        "noautodefrag"
                        "nodatacow"
                        "noatime"
                        "ssd"
                      ];
                      swap.swapfile.size = "8G";
                    };
                  };
                };
              };
            };
          };
        };
      };
    };
  };
}
