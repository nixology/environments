{
  description = "Environments for development and deployment";

  inputs.flake.url = "git+ssh://git@github.com/marksisson/flake";

  outputs = inputs:
    let flakeref = "github:nixology/environments"; in with inputs.flake.lib;
    mkFlake { inherit flakeref inputs; } { imports = modulesIn ./modules; };
}
