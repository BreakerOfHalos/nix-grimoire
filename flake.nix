{
  description = "Heretic's dotfiles";

  outputs =
    inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } { imports = [ ./modules/flake ]; };

  inputs = {
    # our main package supplier
    #
    # you may also notice that I don't use a `github:` url for nixpkgs this is
    # beacuse we can save 15mb of data by using the channel tarball this is not
    # a major saving but it is nice to have
    # https://deer.social/profile/did:plc:mojgntlezho4qt7uvcfkdndg/post/3loogwsoqok2w
    nixpkgs.url = "https://channels.nixos.org/nixpkgs-unstable/nixexprs.tar.xz";

    # lix a good fork of nix
    lix = {
      url = "https://git.lix.systems/lix-project/lix/archive/main.tar.gz";

      inputs = {
        nixpkgs.follows = "nixpkgs";
        pre-commit-hooks.follows = "";
        nix2container.follows = "";
        flake-compat.follows = "";
      };
    };

    # improved support for wsl
    nixos-wsl = {
      type = "github";
      owner = "nix-community";
      repo = "NixOS-WSL";

      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-compat.follows = "";
      };
    };

    # manage userspace with nix
    nix-maid = {
      type = "github";
      owner = "viperML";
      repo = "nix-maid";
    };

    # immutable config management
    wrapper-manager = {
      type = "github";
      owner = "viperML";
      repo = "wrapper-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ### Flake management
    # bring all the mess together with flake-parts
    flake-parts = {
      type = "github";
      owner = "hercules-ci";
      repo = "flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    # easily manage our hosts
    easy-hosts = {
      type = "github";
      owner = "tgirlcloud";
      repo = "easy-hosts";

      # url = "git+file:/Users/isabel/dev/easy-hosts";
    };

    ### Security stuff
    # secure-boot on nixos
    lanzaboote = {
      type = "github";
      owner = "nix-community";
      repo = "lanzaboote";

      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-parts.follows = "flake-parts";
        pre-commit-hooks-nix.follows = "";
        flake-compat.follows = "";
      };
    };

    # Secrets, shhh
    agenix = {
      type = "github";
      owner = "ryantm";
      repo = "agenix";

      inputs = {
        nixpkgs.follows = "nixpkgs";
        systems.follows = "systems";
        home-manager.follows = "";
      };
    };

    ### Additional packages
    noshell = {
      type = "github";
      owner = "viperml";
      repo = "noshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # a tree-wide formatter
    treefmt-nix = {
      type = "github";
      owner = "numtide";
      repo = "treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ### misc
    # declarative theme management
    catppuccin = {
      type = "github";
      owner = "catppuccin";
      repo = "nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    systems = {
      type = "github";
      owner = "nix-systems";
      repo = "default";
    };
  };
}
