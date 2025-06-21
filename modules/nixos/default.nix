{
  _class = "nixos";

  imports = [
    ../generic

    ./boot
    ./environment
    ./hardware
    ./networking
    ./programs
    ./security
    ./services
    ./system
    ./users
    ./catppuccin.nix
    ./extras.nix
    ./headless.nix
    ./nix.nix
    ./programs.nix
    ./secrets.nix
  ];
}
