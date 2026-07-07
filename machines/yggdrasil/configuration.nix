{ pkgs, ... }:

{
  boot.loader.grub.enable = false;
  boot.loader.generic-extlinux-compatible.enable = true;

  networking.hostName = "yggdrasil";
  networking.networkmanager.enable = true;

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    accept-flake-config = true;
    allowed-users = [ "@wheel" ];
    trusted-users = [ "@wheel" ];
  };
  programs.fish.enable = true;
  users.users.nixos = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    uid = 1000;
    shell = pkgs.fish;
  };

  services.openssh.enable = true;

  system.stateVersion = "26.05"; # Do not modify

}
