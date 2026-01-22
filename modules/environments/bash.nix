{ inputs, ... }:
let
  module = {
    perSystem = { pkgs, ... }: with pkgs; {
      shells.default.packages = [ nodePackages.bash-language-server shellcheck ];
    };
  };

  component = {
    imports = [
      module
      inputs.flake.flakeModules.shells
      inputs.flake.flakeModules.systems
    ];
  };
in
{
  flake.modules.flake.bash = component;
}
