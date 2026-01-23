{ inputs, ... }:
let
  module = {
    perSystem = { pkgs, ... }: with pkgs; {
      shells.default.packages = [ nodePackages.bash-language-server shellcheck ];
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
  flake.components.nixology.environments.bash = component;
}
