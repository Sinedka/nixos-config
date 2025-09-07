{pkgs, ...}:
{
  boot.loader = {
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      extraEntries = '''';
    };
    grub.theme = pkgs.stdenv.mkDerivation {
      pname = "minegrub-theme";
      version = "3.1";
      src = pkgs.fetchFromGitHub {
        owner = "Lxtharia";
        repo = "minegrub-theme";
        rev = "v3.1.0";
      hash = "sha256-+7b0jXVVAyIAtYKeZZONZv2qzfESjwITSng1TVjyAfQ=";
      };
      installPhase = "cp -r minegrub $out";
};
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
  };
}
