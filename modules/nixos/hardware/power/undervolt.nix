{
  lib,
  pkgs,
  config,
  ...
}:
let
  inherit (lib) mkIf;
in
{
  config = mkIf config.grimoire.profiles.laptop.enable {
    # temperature target on battery
    services.undervolt = {
      enable = config.grimoire.device.cpu == "intel";
      tempBat = 65; # deg C
      package = pkgs.undervolt;
    };
  };
}
