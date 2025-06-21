{
  imports = [
    ./console.nix # changes to the console
    ./fonts.nix # fonts
    ./locale.nix # locale settings
    ./paths.nix # paths
    ./wayland
    ./xdg.nix # move everything to nice placee
    ./zram.nix # zram optimisation and enabling
  ];
}
