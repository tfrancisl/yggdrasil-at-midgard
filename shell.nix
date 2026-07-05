let
  inputs = import ./inputs.nix;
  inherit (inputs) pkgs;
in
pkgs.mkShell {
  name = "rpi4-server";
  packages = [
    pkgs.just
    pkgs.nixfmt-tree
    pkgs.deadnix
    pkgs.statix
    pkgs.nixf-diagnose
  ];
}
