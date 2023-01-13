{ pkgs, ... }:
{
  users.users."vanilla" = {
    shell = pkgs.fish;

    isNormalUser = true;
    extraGroups = [ "wheel" ];

    password = "";
  };

  users.mutableUsers = false;
}
