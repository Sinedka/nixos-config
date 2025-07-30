{
  programs.bash = {
    enable = true;
    shellAliases = {
      c = "clear";
      rebuild = "sudo nixos-rebuild switch";
      lsss = "ls";
    };
  };
}
