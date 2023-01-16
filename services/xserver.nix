{ nur, pkgs, ... }:
{
  jovian.steam.enable = true;
  networking.networkmanager.enable = true;
  users.extraUsers."vanilla".extraGroups = [ "networkmanager" ];

  services.xserver.enable = true;

  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.mobile.enable = true;

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
