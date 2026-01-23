{ inputs, ... }:
let
  module = {
    imports = with inputs.parts; [
      components.nixology.parts.lib
    ];
  };

  component = {
    inherit module;
  };
in
{
  imports = with inputs.parts; [ module components.nixology.parts.components ];
  flake.components.nixology.environments.lib = component;
}
