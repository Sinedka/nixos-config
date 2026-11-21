{ user, ... }:
{
  services.vpnctl = {
    enable = true;
    operators = [ user ];
    policyUser = user;
    routing.killSwitch = false;
    dns.enable = true;
  };

  home-manager.users.${user}.programs.vpnctl.enable = true;

  security.polkit.enable = true;
  programs.coolercontrol.enable=true;

  environment.etc."polkit-1/rules.d/99-gsr.rules".text = ''
    polkit.addRule(function(action, subject) {
      if (action.id == "org.freedesktop.policykit.exec" &&
          subject.user == "${user}" &&
          action.lookup("program") == "/etc/profiles/per-user/${user}/bin/gsr-kms-server") {
        return polkit.Result.YES;
      }
    });
  '';
}
