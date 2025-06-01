{
  lib,
  config,
  ...
}:
let
  inherit (lib) elem mkIf;
in
{
  config = mkIf (elem "heretic" config.grimoire.system.users) {
    users.users.heretic.openssh.authorizedKeys.keys = [
      "ssh-ed25519 "
    ];
  };
}
