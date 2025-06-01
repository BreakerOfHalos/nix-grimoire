{ lib, _class, ... }:
{
  users.users.root = lib.mkIf (_class == "nixos") {
    initialPassword = "changeme";

    openssh.authorizedKeys.keys = [
      "ssh-ed25519 "
    ];
  };
}
