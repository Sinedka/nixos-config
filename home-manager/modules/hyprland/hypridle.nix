{
  services.hypridle = {
    enable = true;
 
    # general = {
    #     lock_cmd = "pidof hyprlock || hyprlock";
    #     before_sleep_cmd = "loginctl lock-session";
    # };
 
    listner = [
      {
          timeout = 300; # 5mins
          on-timeout = "loginctl lock-session";
      }
      {
          timeout = 600; # 10mins
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
      }
      {
          timeout = 900; # 15mins
          on-timeout = "systemctl suspend || loginctl suspend";
      }
    ];
  };
}
