{ inputs, ... }:
{
  imports = [
    inputs.flake.inputs.flake-parts.flakeModules.flakeModules
    inputs.flake.inputs.flake-parts.flakeModules.modules
    inputs.flake.flakeModules.formatter
  ];
}
