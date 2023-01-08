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

      modules = [ ./bootable.nix ];
      specialArgs = { inherit Jovian-NixOS; };
    };
  };
}
