{ ... }:
{
  services.xserver.enable = true;

  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # /modules/steamdeck/sound.nix
  hardware.pulseaudio.enable = false;
}
