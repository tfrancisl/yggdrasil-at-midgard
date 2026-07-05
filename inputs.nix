let
  inputs = import ./.tack;
  inherit (inputs) nixpkgs;
  lib = import "${nixpkgs}/lib";
  nixosSystem = import "${nixpkgs}/nixos/lib/eval-config.nix";
  nixpkgs-source = inputs.nixpkgs;
  pkgs = nixpkgs.legacyPackages.x86_64-linux;
in
{
  inherit
    inputs
    nixpkgs
    nixosSystem
    lib
    nixpkgs-source
    pkgs
    ;

}
