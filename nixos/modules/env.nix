{
  environment.sessionVariables = rec {
    TERMINAL = "kitty";
    NIXOS_OZONE_WL = "1";
    EDITOR = "nvim";
    XDG_BIN_HOME = "$HOME/.local/bin";
    PATH = [
      "${XDG_BIN_HOME}"
    ];
  };
}
