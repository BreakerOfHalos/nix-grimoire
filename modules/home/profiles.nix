{ osConfig, ... }:
let
  cfg = osConfig.grimoire.profiles;
in
{
  grimoire.profiles = {
    inherit (cfg)
      graphical
      headless
      workstation
      gaming
      laptop
      ;

    # we don't inherit these as there is extra options here
    server = {
      inherit (cfg.server) enable;
    };
  };
}
