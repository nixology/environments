{
  description = "Environments for development and deployment";

  inputs = {
    flake.url = "git+ssh://git@github.com/marksisson/flake";
    nixpkgs.follows = "flake/nixpkgs";
  };

  outputs = inputs: with inputs.flake.lib;
    mkFlake { name = "github:nixology/environments"; inherit inputs; } { imports = modulesIn ./modules; };
}
