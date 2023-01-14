{ ... }:
{
  # /modules/services/x11/desktop-managers/plasma5.nix
  hardware.pulseaudio.enable = true;

  # /modules/steamdeck/sound.nix
  services.pipewire.enable = false;
}
