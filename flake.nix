{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.11";

    Jovian-NixOS.url = "github:Jovian-Experiments/Jovian-NixOS";
    Jovian-NixOS.flake = false;
  };

  outputs = { nixpkgs, Jovian-NixOS, ... }:
    let system = "x86_64-linux"; in

    {
      Jovian = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          # nix build .#Jovian.config.system.build.sdImage -v -L
          "${nixpkgs}/nixos/modules/installer/sd-card/sd-image-x86_64.nix"
          { config.sdImage.compressImage = false; }

          { system.stateVersion = "22.11"; }

          "${Jovian-NixOS}/modules"
          { jovian.devices.steamdeck.enable = true; }

          { networking.networkmanager.enable = true; }
          { nixpkgs.config.allowUnfree = true; }
        ];
      };
    };
}
