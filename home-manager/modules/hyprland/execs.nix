# {pkgs, ...}:
{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      exec-once = [
        # Bar, wallpaper
        "swww init"
        "swww restore"
        "qs"
        
        # Core components (authentication, lock screen, notification daemon)
        # "gnome-keyring-daemon --start --components=secrets"
        # "${pkgs.polkit-kde-agent}/libexec/polkit-kde-authentication-agent-1"
        "hypridle"
        # "dbus-update-activation-environment --all"
        # "sleep 1 && dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        # "hyprpm reload"
        
        # Audio
        # "easyeffects --gapplication-service"
        
        # Clipboard: history
        # "wl-paste --type text --watch cliphist store"
        # "wl-paste --type image --watch cliphist store"
        
        # Cursor
        "hyprctl setcursor Bibata-Modern-Classic 24"
      ];
    };
  };
}
