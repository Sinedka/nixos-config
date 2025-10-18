{
  services.logind = {
    enable = true;
    handleLidSwitch = "suspend";
    handleLidSwitchDocked = "ignore";
  };
}
