{
  pkgs,
  self,
  config,
  ...
}:
let
  inherit (self.lib) anyHome;

  qh = anyHome config;
in
{
  # home-manager is so strange and needs these declared multiple times
  programs = {
    fish.enable;
    zsh.enable;
  };

  grimoire.packages = {
    # GNU core utilities (rewritten in rust)
    # a good idea for usage on macOS too
    inherit (pkgs) uutils-coreutils-noprefix;
  };
}
