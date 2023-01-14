{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.11";

    Jovian-NixOS.url = "github:Jovian-Experiments/Jovian-NixOS";
    Jovian-NixOS.flake = false;

    nixos-generators.url = "github:nix-community/nixos-generators";
    nixos-generators.inputs.nixpkgs.follows = "nixpkgs";

    deploy-rs.url = "github:serokell/deploy-rs";
    deploy-rs.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, nixos-generators, deploy-rs, ... }@inputs: rec {
    Jovian-Image = nixos-generators.nixosGenerate {
      system = "x86_64-linux";
      format = "raw-efi";

      modules = [ ./bootable.nix ];
      specialArgs = { inherit inputs; };
    };

    Jovian = nixpkgs.lib.nixosSystem {
      system = Jovian-Image.system;

      modules = [ ./configuration.nix ];
      specialArgs = { inherit inputs; };
    };

    deploy.nodes.Jovian = {
      sshUser = "root";
      hostname = "192.168.31.158";

      profiles.system.path =
        deploy-rs.lib."${Jovian.pkgs.system}".activate.nixos
          Jovian;
    };
  };
}
