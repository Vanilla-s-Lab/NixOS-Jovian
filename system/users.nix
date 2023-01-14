{ pkgs, ... }:
{
  users.users."vanilla" = {
    shell = pkgs.fish;

    isNormalUser = true;
    extraGroups = [ "wheel" ];

    hashedPassword = "$6$" + "NixOS/Jovian" +
      "$H7c35blb0ZTZpe146BuURZIpJBJD" + "/mNxq" +
      "/UoNgtHGMQB2So6IiqtU4JVasHcEHCWBYQhsWpsb3nbHtv5KZcTl1";
  };

  users.mutableUsers = false;
}
