_: {
  services = {
    pihole-web = {
      enable = true;
      ports = [ "80" ];
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
            "192.168.1.224 yggdrasil.midgard.local"
            "192.168.1.123 valhalla.midgard.local"
          ];
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
