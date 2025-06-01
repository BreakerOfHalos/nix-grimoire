{ lib, config, ... }:
let
  inherit (lib) mkOption optional;
  inherit (lib.types) enum listOf str;
in
{
  options.grimoire.system = {
    mainUser = mkOption {
      type = enum config.garden.system.users;
      description = "The username of the main user for your system";
      default = builtins.elemAt config.grimoire.system.users 0;
    };

    users = mkOption {
      type = listOf str;
      default = [ "heretics" ];
      description = ''
        A list of users that you wish to declare as your non-system users. The first username
        in the list will be treated as your main user unless {option}`grimoire.system.mainUser` is set.
      '';
    };
  };

  config = {
    warnings = optional (config.grimoire.system.users == [ ]) ''
      You have not added any users to be supported by your system. You may end up with an unbootable system!

      Consider setting {option}`config.grimoire.system.users` in your configuration
    '';
  };
}
