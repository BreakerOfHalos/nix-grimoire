let
  /**
    check if the host platform is linux and x86

    # Arguments

    - [pkgs] the package set

    # Type

    ```
    isx86Linux :: AttrSet -> Bool
    ```

    # Example

    ```nix
    isx86Linux pkgs
    => true
    ```
  */
  isx86Linux = pkgs: pkgs.stdenv.hostPlatform.isLinux && pkgs.stdenv.hostPlatform.isx86;

  /**
    assume the first monitor in the list of monitors is primary
    get its name from the list of monitors

    # Arguments

    - [config] the configuration that nixosConfigurations provides

    # Type

    ```
    primaryMonitor :: AttrSet -> String
    ```

    # Example

    ```nix
    primaryMonitor osConfig
    => "DP-1"
    ```
  */
  primaryMonitor = config: builtins.elemAt config.grimoire.device.monitors 0;
in
{
  inherit isx86Linux primaryMonitor;
}
