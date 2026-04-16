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
  };
}
