{ pkgs, user, ... }: {
  programs.zsh.enable = true;

  users = {
    defaultUserShell = pkgs.zsh;
    users.${user} = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "input"
        "networkmanager"
        "kvm"
        "tty"
      ];
    };
  };

  # services.getty.autologinUser = user;
}
