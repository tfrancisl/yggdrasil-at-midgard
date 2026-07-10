_: {
  networking = {
    firewall = {
      allowedUDPPorts = [ ];
      allowedTCPPorts = [
        8091
      ];
    };
  };
  containers = {
    gatus = {
      # consider switching to an unpriveleged container
      ephemeral = true;
      autoStart = true;

      config = import ./guest.nix { };
    };
  };
}
