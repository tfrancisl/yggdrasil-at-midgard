{ lib, ... }: {
  networking = {
    firewall = {
      allowedUDPPorts = [ 53 ];
      allowedTCPPorts = [
        53
        80
        443
      ];
    };
  };
  containers = {
    # not implemented in finix in the same way for sure (systemd-nspawn at core)
    pihole = {
      # consider switching to an unpriveleged container
      ephemeral = false; # pihole has lots of state, this is unavoidable I think
      autoStart = true;

      config = import ./guest.nix {
        inherit lib; # can't we just use specialArgs to forward all of these?
      };
    };
  };
}
