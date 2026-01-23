{
  description = "Environments for development and deployment";

  inputs.parts.url = "git+ssh://git@github.com/marksisson/parts";

  outputs = inputs:
    let flakeref = "github:nixology/environments"; in with inputs.parts.lib;
    mkFlake { inherit flakeref inputs; } { imports = modulesIn ./modules; };
}
