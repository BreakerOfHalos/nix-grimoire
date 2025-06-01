{ lib, _class, ... }:
{
  users.users.root = lib.mkIf (_class == "nixos") {
    initialPassword = "changeme";

    openssh.authorizedKeys.keys = [
      # TODO: Add ssh key
      "ssh-ed25519 "
    ];
  };
}
