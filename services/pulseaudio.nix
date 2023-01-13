{ ... }:
{
  # /modules/steamdeck/sound.nix
  hardware.pulseaudio.enable = false;

  security.rtkit.enable = true;
  services.pipewire.enable = true;
}
