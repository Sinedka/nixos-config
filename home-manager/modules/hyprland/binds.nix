{ pkgs, ... }:
let
  workspace_action = {disp, workspace}: ''hyprctl dispatch ${disp} $(((($(hyprctl activeworkspace -j | jq -r .id) - 1)  / 10) * 10 + ${workspace}))'';

in{
  wayland.windowManager.hyprland.settings = {
    # Основные биндинги Shell
    bindid = [
      # "Super, Super_L, Toggle overview, global, quickshell:overviewToggleRelease"
    ];
    
    bind = [
      # Shell биндинги
      "Super, Super_L, exec, qs ipc call TEST_ALIVE || pkill fuzzel || fuzzel"
      "Super, mouse:272, global, quickshell:overviewToggleReleaseInterrupt"
      "Super, mouse:273, global, quickshell:overviewToggleReleaseInterrupt"
      "Super, mouse:274, global, quickshell:overviewToggleReleaseInterrupt"
      "Super, mouse:275, global, quickshell:overviewToggleReleaseInterrupt"
      "Super, mouse:276, global, quickshell:overviewToggleReleaseInterrupt"
      "Super, mouse:277, global, quickshell:overviewToggleReleaseInterrupt"
      "Super, mouse_up, global, quickshell:overviewToggleReleaseInterrupt"
      "Super, mouse_down, global, quickshell:overviewToggleReleaseInterrupt"
      "Ctrl+Alt, Delete, exec, qs ipc call TEST_ALIVE || pkill wlogout || wlogout -p layer-shell"

      # Session биндинги
      "Super, L, exec, loginctl lock-session"
      "Super+Shift, L, exec, loginctl lock-session"
      "Ctrl+Shift+Alt+Super, Delete, exec, systemctl poweroff || loginctl poweroff"

      # Утилиты - скриншоты, запись, OCR, цвета
      "Super+Shift, S, exec, hyprshot --freeze --clipboard-only --mode region --silent"
      "Super+Shift, R, exec, screenrec-toggle"
      "Super+Shift+Alt, S, exec, grim -g \"$(slurp)\" - | swappy -f -"
      "Super+Shift, T, exec, grim -g \"$(slurp $SLURP_ARGS)\" \"tmp.png\" && tesseract \"tmp.png\" - | wl-copy && rm \"tmp.png\""
      "Super+Shift, C, exec, hyprpicker -a"
      ", Print, exec, grim - | wl-copy"
      "Ctrl, Print, exec, mkdir -p $(xdg-user-dir PICTURES)/Screenshots && grim $(xdg-user-dir PICTURES)/Screenshots/Screenshot_\"$(date '+%Y-%m-%d_%H.%M.%S')\".png"

      # Управление окнами - фокус и перемещение
      "Super, Left, movefocus, l"
      "Super, Right, movefocus, r"
      "Super, Up, movefocus, u"
      "Super, Down, movefocus, d"
      "Super+Shift, Left, movewindow, l"
      "Super+Shift, Right, movewindow, r"
      "Super+Shift, Up, movewindow, u"
      "Super+Shift, Down, movewindow, d"
      "Alt, F4, killactive"
      "Super, Q, killactive"
      "Super+Shift+Alt, Q, exec, hyprctl kill"

      # Позиционирование окон
      "Super+Alt, Space, togglefloating"
      "Super, D, fullscreen, 1"
      "Super, F, fullscreen, 0"
      "Super+Alt, F, fullscreenstate, 0 3"
      "Super, P, pin"

      # Отправка в воркспейсы
      "Super+Alt, 1, exec, ${workspace_action {disp="movetoworkspacesilent"; workspace="1";}}"
      "Super+Alt, 2, exec, ${workspace_action {disp="movetoworkspacesilent"; workspace="2";}}"
      "Super+Alt, 3, exec, ${workspace_action {disp="movetoworkspacesilent"; workspace="3";}}"
      "Super+Alt, 4, exec, ${workspace_action {disp="movetoworkspacesilent"; workspace="4";}}"
      "Super+Alt, 5, exec, ${workspace_action {disp="movetoworkspacesilent"; workspace="5";}}"
      "Super+Alt, 6, exec, ${workspace_action {disp="movetoworkspacesilent"; workspace="6";}}"
      "Super+Alt, 7, exec, ${workspace_action {disp="movetoworkspacesilent"; workspace="7";}}"
      "Super+Alt, 8, exec, ${workspace_action {disp="movetoworkspacesilent"; workspace="8";}}"
      "Super+Alt, 9, exec, ${workspace_action {disp="movetoworkspacesilent"; workspace="9";}}"
      "Super+Alt, 0, exec, ${workspace_action {disp="movetoworkspacesilent"; workspace="10";}}"
      "Super+Shift, mouse_down, movetoworkspace, r-1"
      "Super+Shift, mouse_up, movetoworkspace, r+1"
      "Super+Alt, mouse_down, movetoworkspace, -1"
      "Super+Alt, mouse_up, movetoworkspace, +1"
      "Super+Alt, Page_Down, movetoworkspace, +1"
      "Super+Alt, Page_Up, movetoworkspace, -1"
      "Super+Shift, Page_Down, movetoworkspace, r+1"
      "Super+Shift, Page_Up, movetoworkspace, r-1"
      "Ctrl+Super+Shift, Right, movetoworkspace, r+1"
      "Ctrl+Super+Shift, Left, movetoworkspace, r-1"
      "Super+Alt, S, movetoworkspacesilent, special"
      "Ctrl+Super, S, togglespecialworkspace"
      "Alt, Tab, cyclenext"
      "Alt, Tab, bringactivetotop"

      # Переключение воркспейсов
      "Super, 1, exec, ${workspace_action {disp="workspace"; workspace="1";}}"
      "Super, 2, exec, ${workspace_action {disp="workspace"; workspace="2";}}"
      "Super, 3, exec, ${workspace_action {disp="workspace"; workspace="3";}}"
      "Super, 4, exec, ${workspace_action {disp="workspace"; workspace="4";}}"
      "Super, 5, exec, ${workspace_action {disp="workspace"; workspace="5";}}"
      "Super, 6, exec, ${workspace_action {disp="workspace"; workspace="6";}}"
      "Super, 7, exec, ${workspace_action {disp="workspace"; workspace="7";}}"
      "Super, 8, exec, ${workspace_action {disp="workspace"; workspace="8";}}"
      "Super, 9, exec, ${workspace_action {disp="workspace"; workspace="9";}}"
      "Super, 0, exec, ${workspace_action {disp="workspace"; workspace="10";}}"
      "Ctrl+Super, Right, workspace, r+1"
      "Ctrl+Super, Left, workspace, r-1"
      "Ctrl+Super+Alt, Right, workspace, m+1"
      "Ctrl+Super+Alt, Left, workspace, m-1"
      "Super, Page_Down, workspace, +1"
      "Super, Page_Up, workspace, -1"
      "Ctrl+Super, Page_Down, workspace, r+1"
      "Ctrl+Super, Page_Up, workspace, r-1"
      "Super, mouse_up, workspace, +1"
      "Super, mouse_down, workspace, -1"
      "Ctrl+Super, mouse_up, workspace, r+1"
      "Ctrl+Super, mouse_down, workspace, r-1"
      "Super, S, togglespecialworkspace"
      "Super, mouse:275, togglespecialworkspace"
      "Ctrl+Super, BracketLeft, workspace, -1"
      "Ctrl+Super, BracketRight, workspace, +1"
      "Ctrl+Super, Up, workspace, r-5"
      "Ctrl+Super, Down, workspace, r+5"

      # Приложения
      "Super, Return, exec, ${pkgs.kitty}/bin/kitty -1"
      "Super, T, exec, ${pkgs.kitty}/bin/kitty -1"
      # "Super, E, exec, ${pkgs.dolphin}/bin/dolphin --new-window"
      "Super, W, exec, ${pkgs.brave}/bin/brave"
      "Ctrl+Super, Backslash, resizeactive, exact 640 480"

      # Смена обоев и перезапуск виджетов
      "Ctrl+Super, T, exec, ~/.config/quickshell/scripts/switchwall.sh"
      "Ctrl+Super, R, exec, qs kill; qs &"

      # Тестовые биндинги
      "Super+Alt, f11, exec, bash -c 'RANDOM_IMAGE=$(find ~/Pictures -type f | grep -v -i \"nipple\" | grep -v -i \"pussy\" | shuf -n 1); ACTION=$(notify-send \"Test notification with body image\" \"This notification should contain your user account <b>image</b> and <a href=\\\"https://discord.com/app\\\">Discord</a> <b>icon</b>. Oh and here is a random image in your Pictures folder: <img src=\\\"$RANDOM_IMAGE\\\" alt=\\\"Testing image\\\"/>\" -a \"Hyprland keybind\" -p -h \"string:image-path:/var/lib/AccountsService/icons/$USER\" -t 6000 -i \"discord\" -A \"openImage=Open profile image\" -A \"action2=Open the random image\" -A \"action3=Useless button\"); [[ $ACTION == *openImage ]] && xdg-open \"/var/lib/AccountsService/icons/$USER\"; [[ $ACTION == *action2 ]] && xdg-open \\\"$RANDOM_IMAGE\\\"'"
      "Super+Alt, f12, exec, bash -c 'RANDOM_IMAGE=$(find ~/Pictures -type f | grep -v -i \"nipple\" | grep -v -i \"pussy\" | shuf -n 1); ACTION=$(notify-send \"Test notification\" \"This notification should contain a random image in your <b>Pictures</b> folder and <a href=\\\"https://discord.com/app\\\">Discord</a> <b>icon</b>.\\n<i>Flick right to dismiss!</i>\" -a \"Discord (fake)\" -p -h \"string:image-path:$RANDOM_IMAGE\" -t 6000 -i \"discord\" -A \"openImage=Open profile image\" -A \"action2=Useless button\" -A \"action3=Cry more\"); [[ $ACTION == *openImage ]] && xdg-open \"/var/lib/AccountsService/icons/$USER\"'"
      "Super+Alt, Equal, exec, notify-send \"Urgent notification\" \"Ah hell no\" -u critical -a 'Hyprland keybind'"
    ];

    # Биндинги с модификаторами для мыши
    bindm = [
      "Super, mouse:272, movewindow"
      "Super, mouse:274, movewindow"
      "Super, mouse:273, resizewindow"
    ];

    # Биндинги для изменения соотношения разделения
    binde = [
      "Super, Semicolon, splitratio, -0.1"
      "Super, Apostrophe, splitratio, +0.1"
    ];

    # Биндинги для QuickShell/виджетов
    bindd = [
      # "Super, V, Clipboard history >> clipboard, global, quickshell:overviewClipboardToggle"
      # "Super, Period, Emoji >> clipboard, global, quickshell:overviewEmojiToggle"
      "Super, Tab, Toggle overview, global, quickshell:overviewToggle"
      "Super, N, Toggle right sidebar, global, quickshell:sidebarRightToggle"
      "Super, M, Toggle media controls, global, quickshell:mediaControlsToggle"
      "Ctrl+Alt, Delete, Toggle session menu, global, quickshell:sessionToggle"
      "Super+Shift, S, Screen snip, exec, hyprshot --freeze --clipboard-only --mode region --silent"
      "Super+Shift+Alt, S, Screen snip and annotate, exec, grim -g \"$(slurp)\" - | swappy -f -"
      "Super+Shift, T, Character recognition, exec, grim -g \"$(slurp $SLURP_ARGS)\" \"tmp.png\" && tesseract \"tmp.png\" - | wl-copy && rm \"tmp.png\""
      "Ctrl+Super, T, Change wallpaper, exec, ~/.config/quickshell/scripts/switchwall.sh"
      "Super, L, Lock, exec, loginctl lock-session"
      "Ctrl+Shift+Alt+Super, Delete, Shutdown, exec, systemctl poweroff || loginctl poweroff"
    ];

    # Специальные биндинги
    bindit = [
      ", Super_L, global, quickshell:workspaceNumber"
    ];

    binditn = [
      # "Super, catchall, global, quickshell:overviewToggleReleaseInterrupt"
    ];

    # Биндинги для громкости и яркости
    bindle = [
      ", XF86MonBrightnessUp, exec, qs ipc call brightness increment || agsv1 run-js 'brightness.screen_value += 0.05; indicator.popup(1);'"
      ", XF86MonBrightnessDown, exec, qs ipc call brightness decrement || agsv1 run-js 'brightness.screen_value -= 0.05; indicator.popup(1);'"
      ", XF86AudioRaiseVolume, exec, ${pkgs.wireplumber}/bin/wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 2%+"
      ", XF86AudioLowerVolume, exec, ${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-"
    ];

    # Биндинги для медиа
    bindl = [
      ", XF86AudioMute, exec, ${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_SINK@ toggle"
      ", XF86AudioMicMute, exec, ${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_SOURCE@ toggle"
      "Super+Shift, N, exec, ${pkgs.playerctl}/bin/playerctl next || ${pkgs.playerctl}/bin/playerctl position `${pkgs.bc}/bin/bc <<< \"100 * $(${pkgs.playerctl}/bin/playerctl metadata mpris:length) / 1000000 / 100\"`"
      ", XF86AudioNext, exec, ${pkgs.playerctl}/bin/playerctl next || ${pkgs.playerctl}/bin/playerctl position `${pkgs.bc}/bin/bc <<< \"100 * $(${pkgs.playerctl}/bin/playerctl metadata mpris:length) / 1000000 / 100\"`"
      ", XF86AudioPrev, exec, ${pkgs.playerctl}/bin/playerctl previous"
      "Super+Shift, B, exec, ${pkgs.playerctl}/bin/playerctl previous"
      "Super+Shift, P, exec, ${pkgs.playerctl}/bin/playerctl play-pause"
      ", XF86AudioPlay, exec, ${pkgs.playerctl}/bin/playerctl play-pause"
      ", XF86AudioPause, exec, ${pkgs.playerctl}/bin/playerctl play-pause"
    ];

    bindld = [
      ", Print, Screenshot >> clipboard, exec, ${pkgs.grim}/bin/grim - | ${pkgs.wl-clipboard}/bin/wl-copy"
      "Ctrl, Print, Screenshot >> clipboard & save, exec, mkdir -p $(xdg-user-dir PICTURES)/Screenshots && ${pkgs.grim}/bin/grim $(xdg-user-dir PICTURES)/Screenshots/Screenshot_\"$(date '+%Y-%m-%d_%H.%M.%S')\".png"
      "Super+Shift, M, Toggle mute, exec, ${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_SINK@ toggle"
      "Super+Alt, M, Toggle mic, exec, ${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_SOURCE@ toggle"
      "Super+Shift, L, Suspend system, exec, sleep 0.1 && systemctl suspend || loginctl suspend"
    ];

    # Специальные биндинги для QuickShell
    # bind = [
    #   "Super+Alt, A, global, quickshell:sidebarLeftToggleDetach"
    #   "Super, B, global, quickshell:sidebarLeftToggle"
    #   "Super, O, global, quickshell:sidebarLeftToggle"
    #   "Super+Shift+Alt, mouse:275, exec, ${pkgs.playerctl}/bin/playerctl previous"
    #   "Super+Shift+Alt, mouse:276, exec, ${pkgs.playerctl}/bin/playerctl next || ${pkgs.playerctl}/bin/playerctl position `${pkgs.bc}/bin/bc <<< \"100 * $(${pkgs.playerctl}/bin/playerctl metadata mpris:length) / 1000000 / 100\"`"
    # ] ++ bind; # Добавляем к основным биндингам
  };
  
}
