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
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIALDbHzzJE3GngLn7PkJVrrhyoBR2KVeQdLmSygdiuUt breakerofhalos@nixos"
    ];
  };
}
