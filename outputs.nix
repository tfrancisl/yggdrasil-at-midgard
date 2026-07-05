{
  nixosSystem,
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
      };

      modules = listNixFilesRecursive ./machines/yggdrasil;
    };

  formatter = pkgs.nixfmt-tree;

}
