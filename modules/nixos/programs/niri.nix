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
  options.grimoire.programs.niri = {
    enable = mkEnableOption "Enable niri window manager";
  };
  
  config = mkIf cfg.enable {
    programs.niri.enable = true;

    grimoire.packages = inherit (pkgs) { xwayland-satellite; };

    grimoire.environment.loginManager = "greetd";
  };
} 