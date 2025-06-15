{
  lib,
  config,
  ...
}:
let
  inherit (lib) mkIf;
in
{
  config = mkIf config.grimoire.profiles.graphical.enable {
    programs = grimoire{
      # we need dconf to interact with gtk
      dconf.enable = true;

      # gnome's keyring manager
      seahorse.enable = true;
    };
  };
}
