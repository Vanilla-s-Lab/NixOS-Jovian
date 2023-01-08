{ pkgs, ... }:
{
  users.users."root" = {
    shell = pkgs.fish;

    hashedPassword = "$6" + "$NixOS/Jovian"
      + "$KqCR5fNyd1XhsqlRrkl6TqVd4zOgVPaTuyF"
      + "/aCXzVT1LFypV1slG.p46JnxQgBCJZ4Ecz5gCUyREqrcRCC.0z0";
  };

  users.mutableUsers = false;
}
