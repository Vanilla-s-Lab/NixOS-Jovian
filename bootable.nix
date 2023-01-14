{ pkgs, inputs, ... }:
{
  system.stateVersion = "22.11";

  nixpkgs.config.allowUnfree = true;
  hardware.firmware = [ pkgs.linux-firmware ];

  # https://github.com/Jovian-Experiments/Jovian-NixOS/blob/development/USAGE.md
  imports = [ ("${inputs.Jovian-NixOS}" + "/modules") ];
  jovian.devices.steamdeck.enable = true;

  # https://github.com/nix-community/nixos-generators#format-specific-notes
  # boot.kernelParams = [ "console=tty0" /* "loglevel=5" */ ];
  # boot.loader.timeout = 5;
}
