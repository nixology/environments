{ inputs, ... }:
let
  module = {
    imports = with inputs.parts; [
      components.nixology.parts.formatter
    ];
  };

  component = {
    inherit module;
  };
in
{
  imports = with inputs.parts; [ module components.nixology.parts.components ];
  flake.components.nixology.environments.formatter = component;
}
