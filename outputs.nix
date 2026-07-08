{
  nixpkgs,
  ...
}:
let
  inherit (nixpkgs) lib;
  listNixFilesRecursive =
    module: lib.filter (n: lib.strings.hasSuffix ".nix" n) (lib.filesystem.listFilesRecursive module);
in
{
  nixosConfigurations.yggdrasil = lib.nixosSystem {
    system = "aarch64-linux";
    specialArgs = { };
    modules = (listNixFilesRecursive ./machines/yggdrasil) ++ [ ./containers ];
  };
}
