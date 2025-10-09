{
  pkgs,
  lib,
  username,
  ...
}: {

  # samba
  services.samba = {
    enable = true;
    openFirewall = true; # Automatically opens required ports
    settings = {
      homes = {
        "comment" = "Home Directores";
        "browseable" = "no";
        "read only" = "no";
        "create mask" = "0755";
        "directory mask" = "0755";
        "valid user" = "%S";
      };
    };
  };

  services.nfs.server = {
    enable = true;
    exports = ''
      /home/${username}/workspace  *(rw,sync,no_root_squash,no_subtree_check)
    '';
  };

}