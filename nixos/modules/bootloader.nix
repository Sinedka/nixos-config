{pkgs, ...}:
{
  boot.loader = {
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      extraEntries = ''
      menuentry "Windows" {
        insmod part_gpt
        insmod fat
        insmod chain

        # EFI раздел
        search --no-floppy --fs-uuid --set=root 13F0-D503

        chainloader /EFI/Microsoft/Boot/bootmgfw.efi
      }
      '';
    };
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
  };
}
