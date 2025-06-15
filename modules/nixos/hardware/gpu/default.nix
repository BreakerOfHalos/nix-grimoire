{ lib, ... }:
let
  inherit (lib) mkOption types;
in
{
  imports = [
    ./amd.nix
    ./intel.nix
  ];

  options.grimoire.device.gpu = mkOption {
    type = types.nullOr (
      types.enum [
        "amd"
        "intel"
      ]
    );
    default = null;
    description = "The manufacturer of the primary system gpu";
  };
}
