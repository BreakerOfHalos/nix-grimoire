{
  lib,
  pkgs,
  config,
  ...
}:
let
  inherit (lib)
    mkIf
    mkMerge
    getExe
    mkOption
    mkOptionDefault
    concatStringsSep
    ;
  inherit (lib.types) nullOr enum;

  sessionData = config.services.displayManager.sessionData.desktops;
  sessionPath = concatStringsSep ":" [
    "${sessionData}/share/xsessions"
    "${sessionData}/share/wayland-sessions"
  ];

  cfg = config.grimoire.environment.loginManager;
in
{
  options.grimoire.environment.loginManager = mkOption {
    type = nullOr (enum [
      "ly"
    ]);
    description = "The login manager to be used by the system.";
  };

  config = mkMerge [
    {
      grimoire.environment.loginManager = mkOptionDefault (
        if config.grimoire.profiles.graphical.enable then "ly" else null
      );
    }

    (mkIf (cfg == "ly") {
      services.displayManager.ly = {
        enable = true;
        vt = 2;
        restart = true;

        settings = {
          allow_empty_password = false;
          animation = none;
          box_title = "Welcome to Hell!";
          clear_password = true;
          clock = "%Y-%m-%d %H:%M:%S";
          text_in_center = true;
          bg = 0x0011111b;
          border_fg = 0x00b4befe;
          error_bg = 0x0011111b;
          error_fg = 0x01f38ba;
          fg = 0x001e1e2e;
        };
      };
    })
  ];
}
