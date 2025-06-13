{
  lib,
  pkgs,
  config,
  ...
}:
let
  inherit (lib)
    mkForce
    mkOption
    mkDefault
    mkMerge
    mkIf
    mkEnableOption
    mkPackageOption
    ;
  inherit (lib.types) enum nullOr str;

  cfg = config.grimoire.system.boot;
in
{
  options.grimoire.system.boot = {
    loader = mkOption {
      type = enum [
        "none"
        "systemd-boot"
      ];
      default = "none";
      description = "The bootloader that should be used for the device.";
    };

    memtest = {
      enable = mkEnableOption "memtest86+";
      package = mkPackageOption pkgs "memtest86plus" { };
    };
  };

  config = mkMerge [
    (mkIf (cfg.loader == "none") {
      boot.loader = {
        systemd-boot.enable = mkForce false;
      };
    })

    (mkIf (cfg.loader == "systemd-boot") {
      boot.loader.systemd-boot = {
        enable = mkDefault true;
        configurationLimit = 15; # prevent "too many" configuration from showing up on the boot menu
        consoleMode = mkDefault "max"; # the default is "keep"

        # Fix a security hole. See desc in nixpkgs/nixos/modules/system/boot/loader/systemd-boot/systemd-boot.nix
        editor = false;
      };
    })

    (mkIf cfg.memtest.enable {
      boot.loader.systemd-boot = {
        extraFiles."efi/memtest86plus/memtest.efi" = "${cfg.boot.memtest.package}/memtest.efi";
        extraEntries."memtest86plus.conf" = ''
          title MemTest86+
          efi   /efi/memtest86plus/memtest.efi
        '';
      };
    })
  ];
}
