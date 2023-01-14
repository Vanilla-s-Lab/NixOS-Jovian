{ ... }:
{
  imports = [
    ./bootable.nix

    ./system/networking.nix
    ./system/users.nix

    ./services/xserver.nix
    ./services/pulseaudio.nix
    ./services/openssh.nix
    ./services/fail2ban.nix
  ];

  time.timeZone = "Asia/Shanghai";
}
