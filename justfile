bash:
  nix develop .#bash -c $SHELL

go:
  nix develop .#go -c $SHELL

lua:
  nix develop .#lua -c $SHELL

swift:
  nix develop .#swift -c $SHELL
