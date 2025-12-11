{
  pkgs,
  stateVersion,
  hostname,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ../../nixos/modules
  ];

  environment.systemPackages = [ pkgs.home-manager ];

  networking.hostName = hostname;

  system.stateVersion = stateVersion;
  security.polkit.enable = true;

  environment.etc."polkit-1/rules.d/99-gsr.rules".text = ''
    polkit.addRule(function(action, subject) {
      if (action.id == "org.freedesktop.policykit.exec" &&
          subject.user == "sinedka" &&
          action.lookup("program") == "/etc/profiles/per-user/sinedka/bin/gsr-kms-server") {
        return polkit.Result.YES;
      }
    });
  '';}
