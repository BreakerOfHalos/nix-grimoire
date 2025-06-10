{ lib, _class, ... }:
{
  users.users.root = {
    initialPassword = "changeme";

    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIALDbHzzJE3GngLn7PkJVrrhyoBR2KVeQdLmSygdiuUt breakerofhalos@nixos"
    ];
  };
}
