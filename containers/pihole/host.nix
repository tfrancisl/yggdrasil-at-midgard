_: {
  networking = {
    firewall = {
      allowedUDPPorts = [ 53 ];
      allowedTCPPorts = [
        53
        80
      ];
    };
  };
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
      config = import ./guest.nix { };
    };
  };
}
