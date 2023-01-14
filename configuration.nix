{ ... }:
{
  imports = [
    ./bootable.nix

    ./system/networking.nix
    ./system/users.nix

    ./services/xserver.nix
    ./services/pulseaudio.nix
    ./services/openssh.nix
  ];

  time.timeZone = "Asia/Shanghai";
}
