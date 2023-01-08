{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.11";

    Jovian-NixOS.url = "github:Jovian-Experiments/Jovian-NixOS";
    Jovian-NixOS.flake = false;

    nixos-generators.url = "github:nix-community/nixos-generators";
    nixos-generators.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, Jovian-NixOS, nixos-generators, ... }: rec {
    Jovian-Image = nixos-generators.nixosGenerate rec {
      system = "x86_64-linux";
      format = "raw-efi";

      modules = [
        { system.stateVersion = "22.11"; }

        { nixpkgs.config.allowUnfree = true; }
        { hardware.enableAllFirmware = true; }

        # https://github.com/Jovian-Experiments/Jovian-NixOS/blob/development/USAGE.md
        { imports = [ ("${Jovian-NixOS}" + "/modules") ]; }
        { jovian.devices.steamdeck.enable = true; }

        # https://github.com/nix-community/nixos-generators#format-specific-notes
        { boot.kernelParams = [ "console=tty0" "loglevel=5" ]; }
        { boot.loader.timeout = 5; }
      ];
    };
  };
}
