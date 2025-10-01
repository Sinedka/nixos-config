{pkgs, ...}:
{
  home.packages = with pkgs; [
    clang
    scons
    pkg-config
    godot_4
  ];
}
