{ ... }:
{
  jovian.steam.enable = true;
  networking.networkmanager.enable = true;

  services.xserver.enable = true;
  services.xserver.displayManager.autoLogin.enable = true;
  services.xserver.displayManager.autoLogin.user = "vanilla";
}
