{
  _class = "nixos";

  imports = [
    ../base

    ./boot
    ./environment
    ./hardware
    ./networking
    ./programs
    ./security
    ./services
    ./system
    ./catppuccin.nix
    ./emulation.nix
    ./headless.nix
    ./nix.nix
  ];
}
