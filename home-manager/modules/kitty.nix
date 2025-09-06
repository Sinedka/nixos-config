{pkgs, ...}:
{
  home.packages = [
    pkgs.imagemagick
  ];
  programs.kitty = {
    enable = true;
    
    font = {
      name = "FiraCode Nerd Font";
      size = 11.0;
    };
    
    settings = {
      # Автоматические шрифты для жирного и курсива
      bold_font = "auto";
      italic_font = "auto";
      
      # Включаем поддержку лигатур
      disable_ligatures = "never";
      
      # Убираем подтверждение закрытия окна
      confirm_os_window_close = 0;
      
      # Настройки курсора и прозрачности
      cursor_trail = 2;
      cursor_shape = "block";
      shell_integration = "no-cursor";
      background_opacity = "0.3";
    };
    
    keybindings = {
      # Увеличение шрифта
      "ctrl+plus" = "change_font_size all +1";
      "ctrl+equal" = "change_font_size all +1";
      "ctrl+kp_add" = "change_font_size all +1";
      
      # Уменьшение шрифта
      "ctrl+minus" = "change_font_size all -1";
      "ctrl+underscore" = "change_font_size all -1";
      "ctrl+kp_subtract" = "change_font_size all -1";
      
      # Сброс размера шрифта
      "ctrl+0" = "change_font_size all 0";
      "ctrl+kp_0" = "change_font_size all 0";
    };
  };
}
