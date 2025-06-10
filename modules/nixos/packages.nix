{
  lib,
  config,
  _class,
  ...
}:
let
  inherit (lib) mkOption mergeAttrsList optionalAttrs;
  inherit (lib.types) attrsOf package;
in
{
  options.grimoire.packages = mkOption {
    type = attrsOf package;
    default = { };
    description = ''
      A set of packages to install in the grimoire environment.
    '';
  };

  config = mergeAttrsList [
    (optionalAttrs (_class == "nixos") {
      environment.systemPackages = builtins.attrValues config.grimoire.packages;
    })

    (optionalAttrs (_class == "maid") {
      maid.packages = builtins.attrValues config.grimoire.packages;
    })
  ];
}
