{ ... }:
{
  jovian.steam.enable = true;
  networking.networkmanager.enable = true;
  users.extraUsers."vanilla".extraGroups = [ "networkmanager" ];

  services.xserver.enable = true;

  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.mobile.enable = true;
}
