{
  lib,
  self,
  _class,
  config,
  ...
}:
let
  inherit (lib) mkOption;

  cfg = config.grimoire.system;
in
{
  options.grimoire.system.stateVersion = mkOption {
    type = lib.types.str;
    default = "25.05";
  };

  config.system = {
    # this is the NixOS version that the configuration was generated with
    # this should be change to the version of the NixOS release that the configuration was generated with
    # https://nixos.org/manual/nixos/unstable/release-notes.html
    stateVersion = cfg.stateVersion;

    # we can get the git rev that we are working on and set that to the configurationRevision
    # this *might* be useful for debugging
    configurationRevision = self.shortRev or self.dirtyShortRev or "dirty";
  };
}
