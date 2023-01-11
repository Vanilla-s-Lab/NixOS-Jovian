{ pkgs, ... }:
{
  users.users."vanilla" = {
    shell = pkgs.fish;

    isNormalUser = true;
    extraGroups = [ "wheel" ];

    hashedPassword = "$6" + "$NixOS/Jovian"
      + "$KqCR5fNyd1XhsqlRrkl6TqVd4zOgVPaTuyF"
      + "/aCXzVT1LFypV1slG.p46JnxQgBCJZ4Ecz5gCUyREqrcRCC.0z0";
  };

  users.mutableUsers = false;
}
