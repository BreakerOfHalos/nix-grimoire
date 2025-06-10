{pkgs, ...}:
{
  # home-manager is so strange and needs these declared multiple times
  programs = {
    fish.enable = true;
    zsh.enable = true;
  };

  grimoire.packages = {
    # GNU core utilities (rewritten in rust)
    # a good idea for usage on macOS too
    inherit (pkgs) uutils-coreutils-noprefix;
  };
}
