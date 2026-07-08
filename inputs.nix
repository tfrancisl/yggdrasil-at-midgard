let
  inputs = import ./.tack;
  inherit (inputs) nixpkgs;
in
{
  inherit
    inputs
    nixpkgs
    ;

}
