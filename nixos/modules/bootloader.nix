{pkgs, ...}:
{
  boot.loader = {
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      extraEntries = ''
        menuentry "Windows Boot Manager" {
          insmod part_gpt
          insmod fat
          set root='hd0,gpt1'
          chainloader /EFI/Microsoft/Boot/bootmgfw.efi
        }

        menuentry "Arch Linux" {
          insmod part_gpt
          insmod ext2
          set root='hd0,gpt6'
          linux /boot/vmlinuz-linux root=/dev/nvme0n1p6 rw
          initrd /boot/initramfs-linux.img
        }
      '';
    };
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
  };
}
