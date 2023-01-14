{ ... }:
{
  imports = [
    ./bootable.nix

    ./system/networking.nix
    ./system/users.nix

    ./services/xserver.nix
    ./services/pulseaudio.nix
  ];

  time.timeZone = "Asia/Shanghai";
}
