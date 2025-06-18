{ timezone, stateVersion, ... }:
{
  time.timeZone = timezone;

  system.stateVersion = stateVersion;

  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 100;
    priority = 999;
  };
}
