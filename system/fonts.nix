{ nur, pkgs, ... }:
{
  nixpkgs.overlays = [
    nur.overlay

    (self: super: {
      steam = super.steam.override {
        extraPkgs = pkgs: [
          pkgs.nur.repos.vanilla.Win10_LTSC_2021_fonts
        ];
      };
    })
  ];

  environment.systemPackages = [
    pkgs.nur.repos.vanilla.Win10_LTSC_2021_fonts
  ];
}
