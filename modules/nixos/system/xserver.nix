{
  config,
  lib,
  pkgs,
  ...
}:
let
  inherit (lib) mkIf;
in
{
  config = mkIf config.grimoire.profiles.graphical.enable {
    services = {
      xserver = {
        enable = true;
        startDbusSession = true;
        layout = "us";

        libinput.enable = true;

        displayManager.defaultSession = "none+xmonad";

        windowManager.xmonad = {
          enable = true;
          enableContribAndExtras = true;
        };
      };
    };
  };
}