{ ... }: {
  services = {
    pihole-web = {
      enable = true;
      ports = [ "443s" ];
    };
    pihole-ftl = {
      enable = true;
      settings = {
        dns = {
          upstreams = [
            "9.9.9.9"
            "1.1.1.1"
          ];
          hosts = [
            "192.168.1.224 yggdrasil.midgard"
            "192.168.1.123 valhalla.midgard"
          ];
        };
      };
      lists = [
        {
          url = "https://raw.githubusercontent.com/hagezi/dns-blocklists/main/adblock/pro.txt";
          type = "block";
          enabled = true;
          description = "hagezi blocklist";
        }
      ];
    };
  };
}
