{
  # substituters to use
  nix.settings = {
    # don't worry that you cannot see cache.nixos.org here, it is added by default
    substituters = [
      "https://nix-community.cachix.org" # nix-community cache
      "https://catppuccin.cachix.org" # a cache for all catppuccin ports
    ];

    trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "catppuccin.cachix.org-1:noG/4HkbhJb+lUAdKrph6LaozJvAeEEZj4N732IysmU="
    ];
  };
}
