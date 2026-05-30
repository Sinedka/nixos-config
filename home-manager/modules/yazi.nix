{ pkgs, ... }:
let
  tokyoNightTheme = pkgs.fetchFromGitHub {
    owner = "BennyOe";
    repo = "tokyo-night.yazi";
    rev = "main";
    sha256 = "039wyx3q1ws0hr9frc3lby967gl1fxyxd58b0q8y9v43sx3f22ic";

  };
in
{
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    flavors = {
      tokyo-night = tokyoNightTheme;
    };
    theme = {
      flavor = {
        dark = "tokyo-night";
        light = "tokyo-night";
      };
    };
    extraPackages = (
      with pkgs.yaziPlugins;
      [
        # unar
        ouch
        sudo
        chmod
        dupes
        mount
      ]
    )++([
      pkgs.nushell
    ]);
    plugins = {
      inherit (pkgs.yaziPlugins) mount ouch sudo;
    };
    keymap = {
      mgr.prepend_keymap = [
        {
          run = "plugin mount";
          on = [ "M" ];
        }
        {
          on = [
            "R"
            "p"
            "p"
          ];
          run = "plugin sudo -- paste";
        }
        {
          on = [
            "R"
            "P"
          ];
          run = "plugin sudo -- paste --force";
        }
        {
          on = [
            "R"
            "r"
          ];
          run = "plugin sudo -- rename";
        }
        {
          on = [
            "R"
            "p"
            "l"
          ];
          run = "plugin sudo -- link";
        }
        {
          on = [
            "R"
            "p"
            "r"
          ];
          run = "plugin sudo -- link --relative";
        }
        {
          on = [
            "R"
            "p"
            "L"
          ];
          run = "plugin sudo -- hardlink";
        }
        {
          on = [
            "R"
            "a"
          ];
          run = "plugin sudo -- create";
        }
        {
          on = [
            "R"
            "d"
          ];
          run = "plugin sudo -- remove";
        }
        {
          on = [
            "R"
            "D"
          ];
          run = "plugin sudo -- remove --permanently";
        }
        {
          on = [
            "R"
            "m"
          ];
          run = "plugin sudo -- chmod";
        }
      ];
    };
  };
}
