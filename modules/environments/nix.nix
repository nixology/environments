{ inputs, ... }:
let
  module = {
    perSystem = { pkgs, ... }: with pkgs; {
      shells.default.packages = [ nil nix-output-monitor ];
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
  flake.modules.flake.nix = component;
}
