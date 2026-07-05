{
  nixosSystem,
  nixpkgs-source,
  pkgs,
  lib,
  ...
}:
let

  system = "x86_64-linux";
  listNixFilesRecursive =
    module: lib.filter (n: lib.strings.hasSuffix ".nix" n) (lib.filesystem.listFilesRecursive module);

in
{

  nixosConfigurations.yggdrasil =

    nixosSystem {
      inherit system;
      specialArgs = {
        inherit nixpkgs-source;
      };

      modules = listNixFilesRecursive ./machines/yggdrasil;
    };

  formatter = pkgs.nixfmt-tree;

}
