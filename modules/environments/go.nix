{ inputs, ... }:
let
  module = {
    perSystem = { pkgs, ... }: with pkgs; {
      shells.default.packages = [ go gotools golangci-lint ];
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
  flake.modules.flake.go = component;
}
