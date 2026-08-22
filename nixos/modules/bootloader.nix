{ pkgs, ... }:
{
  boot = {
    kernel.sysctl."vm.swappiness" = 10;
    kernelModules = [ "amdgpu" ];
    kernelPackages = pkgs.linuxPackages_cachyos; # cachyos kernel with zen4 microarchitecture optimizations
    kernelParams = [
      "boot.shell_on_fail"
      "udev.log_priority=3"
      "rd.systemd.show_status=auto"
      "preempt=full"
    ];
    initrd.systemd.enable = true;
    loader = {
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
  };
}
