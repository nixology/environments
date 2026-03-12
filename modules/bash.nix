{ inputs, ... }:
let
  module = {
    perSystem = { pkgs, ... }: let
      env = {
        packages = with pkgs; [ nodePackages.bash-language-server shellcheck ];
      };
    in {
      environments.bash = env;
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
  flake.components = { nixology.environments.bash = component; };
}
