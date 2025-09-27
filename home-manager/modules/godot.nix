{pkgs, ...}:
{
  programs.godot = {
    enable = true;
    package = pkgs.godot_4;
  };
  home.packages = with pkgs; [
    clang
    scons
    pkg-config
  ]
}
