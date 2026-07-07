{ pkgs, ... }:

{
  boot.loader.grub.enable = false;
  boot.loader.generic-extlinux-compatible.enable = true;

  networking = {
    hostName = "yggdrasil";
    networkmanager.enable = true;
    # following are all for pihole container, rethink where this is defined
    firewall = {
      allowedUDPPorts = [ 53 ];
      allowedTCPPorts = [ 53 80 ];
    };
  };

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

  # probably move this to containers/default.nix?
  containers = {
    # not implemented in finix in the same way for sure (systemd-nspawn at core)
    pihole = {
      # consider switching to an unpriveleged container
      ephemeral = false; # pihole has lots of state, this is unavoidable I think
      autoStart = true;

      forwardPorts = [
        {
          containerPort = 80;
          hostPort = 80;
          protocol = "tcp";
        }
        {
          containerPort = 53;
          hostPort = 53;
          protocol = "udp";
        }
        {
          containerPort = 53;
          hostPort = 53;
          protocol = "tcp";
        }
      ];
      config = import ../../containers/pihole.nix { };
    };
  };

}
