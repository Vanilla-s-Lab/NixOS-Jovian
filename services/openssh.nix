{ lib, pkgs, ... }:
rec {
  services.openssh.enable = true;
  services.openssh.passwordAuthentication = false;

  users.users."root".openssh.authorizedKeys.keyFiles =
    lib.singleton (pkgs.fetchurl {
      url = "https://github.com/VergeDX.keys"; # Yubikeys 5 NFC
      hash = "sha256-ASglsi7Ape5I9MabvIiWXPI7IeumBaoVTb+pX3Hm5EA=";
    });

  users.users."vanilla".openssh.authorizedKeys.keyFiles =
    users.users."root".openssh.authorizedKeys.keyFiles;
}
