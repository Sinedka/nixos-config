{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bibata-cursors
  ];

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    name = "Bibata-Modern-Classic";
    size = 24;
    package = pkgs.bibata-cursors;
  };
}
