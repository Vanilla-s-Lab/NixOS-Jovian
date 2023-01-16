{ pkgs, ... }:
{
  jovian.steam.enable = true;
  networking.networkmanager.enable = true;
  users.extraUsers."vanilla".extraGroups = [ "networkmanager" ];

  services.xserver.enable = true;

  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.mobile.enable = true;

  services.xserver.desktopManager.plasma5.mobile.installRecommendedSoftware = false;
  environment.systemPackages = [ pkgs.libsForQt5.plasma-settings ];
}
