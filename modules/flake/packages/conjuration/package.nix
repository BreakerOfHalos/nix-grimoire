{
  nix,
  gum,
  vim,
  parted,
  nixos-install,
  writeShellApplication,
}:
writeShellApplication {
  name = "conjuration";

  runtimeInputs = [
    nix
    gum
    vim
    parted
    nixos-install
  ];

  text = builtins.readFile ./conjuration.sh;
}
