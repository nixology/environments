{ inputs, ... }:
let
  module = {
    perSystem = { pkgs, ... }: let
      env = {
        packages = with pkgs; [ go gotools golangci-lint ];
      };
    in {
      environments.go = env;
      environments.default = env;
    };
  };

  component = {
    inherit module;
    dependencies = with inputs.flake.components; [
      nixology.extra.environments
    ];
  };
in
{
  imports = [ module ];
  flake.components = { nixology.environments.go = component; };
}
