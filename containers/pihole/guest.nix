{ lib, ... }: {

  networking.firewall.enable = false; # use the hosts firewall

  services = {
    pihole-web = {
      enable = true;
      ports = [
        "80r"
        "443so"
      ];
    };
    pihole-ftl = {
      enable = true;
      openFirewallWebserver = true;
      openFirewallDNS = true;
      settings = {
        dns = {
          upstreams = [
            "1.1.1.1"
          ];
          hosts = [
            "192.168.1.224 yggdrasil.midgard.lan"
            "192.168.1.123 valhalla.midgard.lan"
          ];
          hostRecord = "yggdrasil,yggdrasil.midgard.lan,192.168.1.224";
          piholePTR = "HOSTNAMEFQDN";
          domain = {
            name = "midgard.lan";
            local = true;
          };
        };
        webserver = {
          domain = lib.mkForce "yggdrasil.midgard.lan";
        };
      };
      lists = [
        {
          url = "https://media.githubusercontent.com/media/zachlagden/Pi-hole-Optimized-Blocklists/main/lists/comprehensive.txt";
          type = "block";
          enabled = true;
          description = "zachlagden/Pi-hole-Optimized-Blocklists/main/lists/comprehensive.txt";
        }
      ];
    };
  };
}
