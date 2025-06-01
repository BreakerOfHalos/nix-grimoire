{
  lib,
  _class,
  config,
  ...
}:
let
  inherit (lib) mkEnableOption mergeAttrsList optionalAttrs;

  cfg = config.grimoire.system.tools;
in
{
  options.grimoire.system.tools = {
    enable = mkEnableOption "tools" // {
      default = true;
    };

    minimal = mkEnableOption "limit to minimal system tooling" // {
      default = true;
    };
  };

  config = {
    system = {
      disableInstallerTools = cfg.minimal;
      rebuild.enableNg = true;

      tools = {
        nixos-version.enable = true;
        nixos-rebuild.enable = true;
      };
    };
  }
}
