{ lib, ... }:
let
  inherit (lib)
    getAttrFromPath
    filter
    hasAttr
    any
    ;

  /**
    a function that will append a list of groups if they exist in config.users.groups

    # Arguments

    - [config] the configuration that nixosConfigurations provides
    - [groups] a list of groups to check for

    # Type

    ```
    ifTheyExist :: AttrSet -> List -> List
    ```

    # Example

    ```nix
    ifTheyExist config ["wheel" "users"]
    => ["wheel"]
    ```
  */
  ifTheyExist = config: groups: filter (group: hasAttr group config.users.groups) groups;

in
{
  inherit
    ifTheyExist
    ;
}
