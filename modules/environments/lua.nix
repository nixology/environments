{ inputs, ... }:
let
  module = {
    perSystem = { pkgs, ... }: with pkgs; {
      shells.default.packages = [ lua5_1 ];
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
  flake.modules.flake.lua = component;
}
