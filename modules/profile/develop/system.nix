{
  pkgs,
  lib,
  username,
  virtualisation,
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

  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
    daemon.settings = {
      data-root = "/opt/docker";
      registry-mirrors = [
        "https://docker.m.daocloud.io"
        "https://docker.1ms.run"
      ];
      insecure-registries = [
        "10.0.5.99:5000"
      ];
    };
  };
  users.extraGroups.docker.members = [username];

}