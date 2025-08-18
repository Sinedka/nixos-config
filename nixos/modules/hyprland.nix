{
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };

  security.pam.services.hyprlock = {};

  programs.uwsm = {
    enable = true;
    # waylandCompositors = {
    #   hyprland = {
    #     prettyName = "Hyprland";
    #     comment = "Hyprland with UWSM support";
    #     binPath = "/run/current-system/sw/bin/Hyprland";
    #   };
    # };
  };
}
