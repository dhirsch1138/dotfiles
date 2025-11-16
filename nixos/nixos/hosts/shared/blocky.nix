{ config, pkgs, ... }:
{
  
  #disable network manager's DNS handling as we are using blocky
  #use localhost as name server now
  networking = {
    nameservers = [ "127.0.0.1 "];
    networkmanager.dns = "none";
    useDHCP = false;
    dhcpcd.enable = false;
  };
  
  services.blocky = {
    enable = true;
    settings = {
      ports.dns = 53; # Port for incoming DNS Queries.
      upstreams.groups.default = [
        "https://one.one.one.one/dns-query" # Using Cloudflare's DNS over HTTPS server for resolving queries.
      ];
      # For initially solving DoH/DoT Requests when no system Resolver is available.
      bootstrapDns = {
        upstream = "https://one.one.one.one/dns-query";
        ips = [ "1.1.1.1" "1.0.0.1" ];
      };
      #Enable Blocking of certain domains.
      blocking = {
        denylists = {
          #Adblocking
          ads = [
                 "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts"
                 "https://easylist.to/easylist/easylist.txt"
                ];
          privacy = [
                      "https://easylist.to/easylist/easyprivacy.txt"
                    ];
          #Another filter for blocking adult sites
          adult = ["https://blocklistproject.github.io/Lists/porn.txt"];
          #You can add additional categories
        };
        #Configure what block categories are used
        clientGroupsBlock = {
          default = [ "ads" "privacy" ];
          kids-ipad = ["ads" "privacy" "adult"];
        };
      };
      caching = {
        #min was 5m
        minTime = "15m";
        #max was 30
        maxTime = "90m"; 
        #prefetching = true;
      };
    };
  };
}
