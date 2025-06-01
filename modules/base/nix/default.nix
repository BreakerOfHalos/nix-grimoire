{
  imports = [
    ./environment.nix # environment settings that nix requires
    ./nix.nix # nix the package manager's settings
    ./substituters.nix # nixpkgs substituters
  ];

