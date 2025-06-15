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
    # pretty much handled by brightnessctl
    hardware.acpilight.enable = false;

    # handle ACPI events
    services.acpid.enable = true;

    grimoire.packages = { inherit (pkgs) acpi powertop; };

    boot = {
      kernelModules = [ "acpi_call" ];
      extraModulePackages = with config.boot.kernelPackages; [
        acpi_call
        cpupower
      ];
    };
  };
}
