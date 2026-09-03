{ user, ... }:
{
  security.polkit.enable = true;

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
