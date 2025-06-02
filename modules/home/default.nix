{
  imports = [
    ../generic

    ./environment # environment variables & path
    ./packages # pre-configured packages
    ./programs # options to configure programs
    ./themes # themes for applications
    ./docs.nix # no more docs
    ./home.nix # home settings
    ./profiles.nix # profiles for different machines
    ./secrets.nix # secrets for the home directory
  ];
}
