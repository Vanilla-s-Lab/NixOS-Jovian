{ pkgs, lib, ... }:
let generated = pkgs.callPackage
  ../_sources/generated.nix
  { }; in

{
  services.xserver.enable = true;

  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # /modules/steamdeck/sound.nix
  hardware.pulseaudio.enable = false;

  # https://github.com/NixOS/nixpkgs/issues/191711
  nixpkgs.overlays = lib.singleton (final: prev: {
    gnome = prev.gnome // rec {

      gnome-shell = (prev.gnome.gnome-shell.override {
        inherit mutter;
      }).overrideAttrs (super:

        with generated.gnome-shell-mobile; rec {
          inherit pname version src;

          postPatch = "touch data/theme/gnome-shell.css"
            + "\n" + prev.gnome.gnome-shell.postPatch;
        });

      mutter = prev.gnome.mutter.overrideAttrs (super:
        with generated.mutter-mobile; rec {
          inherit pname version src;

          # https://gist.github.com/chuangzhu/446399874774b4959923c3af7cd44c87
          patches = lib.singleton ./patches/rebased-285a5a4d.patch;
        });
    };
  });
}
