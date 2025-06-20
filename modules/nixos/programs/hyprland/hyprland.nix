{
  self,
  pkgs,
  config,
  ...
}:
let
  inherit (self.lib) mkProgram;
in
{
  options.grimoire.programs = {
    hyprland = mkProgram pkgs "hyprland" {
      enable.default = config.grimoire.profiles.graphical.enable;
      withUWSM = true;
    };
  };
} 