{ ... }:
{
  imports = [
    ./bootable.nix

    ./system/networking.nix
    ./system/users.nix
  ];
}
