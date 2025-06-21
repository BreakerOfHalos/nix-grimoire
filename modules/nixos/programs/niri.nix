{
  lib,
  pkgs,
  config,
  inputs,
  ...
}:
let
  inherit (lib) mkIf mkEnableOption;

  cfg = config.grimoire.programs.niri;
in
{
  imports = [inputs.niri.nixosModules.niri];
  
  options.grimoire.programs.niri = {
    enable = mkEnableOption "Enable niri window manager";
  };
  
  config = mkIf cfg.enable {
    niri-flake.cache.enable = true;
    nixpkgs.overlays  = [inputs.niri.overlays.niri];

    programs.niri = {
      enable = false;
      package = pkgs.niri-unstable;
    };
  };
} 