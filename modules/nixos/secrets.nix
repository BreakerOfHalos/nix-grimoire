{
  lib,
  _class,
  pkgs,
  inputs,
  ...
}:
let
  inherit (lib) mkIf getExe;
in
{
  imports = [ inputs.agenix.nixosModules.default ];

  age = {
    ageBin = getExe pkgs.rage;
  };
}
