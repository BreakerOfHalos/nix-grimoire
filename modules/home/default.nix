{
  imports = [
    ../generic

    ./environment # environment variables & path
    ./packages # pre-configured packages
    ./programs # options to configure programs
    ./themes # themes for applications
    ./home.nix # home settings
    ./profiles.nix # profiles for different machines
    ./secrets.nix # secrets for the home directory
  ];
}
