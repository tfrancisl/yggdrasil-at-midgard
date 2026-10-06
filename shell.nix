let
  inputs = import ./inputs.nix;
  system = builtins.currentSystem;
  pkgs = inputs.nixpkgs.legacyPackages.${system};
in
pkgs.mkShell {
  name = "rpi4-server";
  TACK_DIR = "./.tack";
  packages = [
    pkgs.tack
    pkgs.just
    pkgs.nixfmt-tree
    pkgs.deadnix
    pkgs.statix
    pkgs.nixf-diagnose
  ];
}
