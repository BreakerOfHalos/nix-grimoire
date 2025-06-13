{ self, ... }:
let
  template = self.lib.template.xdg;
in
{
  environment = {
    variables = template.global;
    etc = {
      inherit (template) pythonrc;
    };

    sessionVariables = template.user template.simple;
  };
}
