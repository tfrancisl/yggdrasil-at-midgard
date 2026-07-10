_: {
  networking.firewall.enable = false; # use the hosts firewall
  services = {
    gatus = {
      enable = true;
      configFile = ./gatus.yml;
    };
  };
}
