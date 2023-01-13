{ ... }:
{
  imports = [
    ./bootable.nix

    ./system/networking.nix
    ./system/users.nix

    ./services/xserver.nix
    ./services/pipewire.nix
  ];

  time.timeZone = "Asia/Shanghai";
}
