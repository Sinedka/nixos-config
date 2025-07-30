{ pkgs, ...}:
{
  environment.variables = {
    # Используем системный Electron вместо загрузки бинарника
    ELECTRON_SKIP_BINARY_DOWNLOAD = "1";
    ELECTRON_OVERRIDE_DIST_PATH = "${pkgs.electron}/bin/";
    
    # Для корректной работы с Wayland в Hyprland
    ELECTRON_OZONE_PLATFORM_HINT = "wayland";
  };
}
