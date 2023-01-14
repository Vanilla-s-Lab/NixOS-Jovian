{ ... }:
{
  # https://github.com/nix-community/nixos-generators/blob/master/formats/raw-efi.nix

  boot.loader.grub = {
    device = "nodev";
    efiSupport = true;
    efiInstallAsRemovable = true;
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-label/ESP";
    fsType = "vfat";
  };

  # https://github.com/nix-community/nixos-generators/blob/master/formats/raw.nix

  fileSystems."/" = {
    device = "/dev/disk/by-label/nixos";
    autoResize = true;
    fsType = "ext4";
  };

  boot = {
    growPartition = true;
    kernelParams = [ "console=ttyS0" ];
    # loader.grub.device = lib.mkDefault "/dev/vda";
    # loader.timeout = lib.mkDefault 0;
    initrd.availableKernelModules = [ "uas" ];
  };
}
