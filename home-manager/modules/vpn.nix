{
  programs.vpnctl = {
    enable = true;
    syncOnLogin = true;
    settings = {
      theme = "dark";
      diagnostics = { pingTarget = "1.1.1.1"; pingInterval = 5; };
      routing = {
        directIPs = [ ];
        directDomains = ["2ip.io"];
        applications = [
          { name = "steam"; action = "direct"; enabled = true; }
        ];
      };
    };
  };
}
