{
  lib,
  pkgs,
  config,
  inputs,
  ...
}:
let
  inherit (lib.modules) mkIf mkForce;
  inherit (lib.options) mkEnableOption;
  sys = config.grimoire.system.boot;
in
{
  # https://wiki.nixos.org/wiki/Secure_Boot
  # Secure Boot
  imports = [ inputs.lanzaboote.nixosModules.lanzaboote ];

  options.grimoire.system.boot.secureBoot = mkEnableOption ''
    secure-boot and load necessary packages, say good bye to systemd-boot
  '';

  config = mkIf sys.secureBoot {
    grimoire.packages = { inherit (pkgs) sbctl; };

    # Lanzaboote replaces the systemd-boot module.
    boot.loader.systemd-boot.enable = mkForce false;

    boot = {
      bootspec.enable = true;
      lanzaboote = {
        enable = true;
        pkiBundle = "/var/lib/sbctl";
      };
    };
  };
}
