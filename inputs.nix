let
  inputs = import ./.tack;
  inherit (inputs) nixpkgs;
  inherit (nixpkgs) lib;
  inherit (lib) nixosSystem;

  pkgs = nixpkgs.legacyPackages.x86_64-linux;
in
{
  inherit
    inputs
    nixpkgs
    nixosSystem
    lib
    pkgs
    ;

}
