{ inputs, ... }:
let
  module = {
    perSystem = { pkgs, ... }: with pkgs; {
      shells.default.packages = [ go gotools golangci-lint ];
    };
  };

  component = {
    inherit module;
    dependencies = with inputs.parts; [
      components.nixology.parts.devShells
    ];
  };
in
{
  imports = with inputs.parts; [ components.nixology.parts.components ];
  flake.components.nixology.environments.go = component;
}
