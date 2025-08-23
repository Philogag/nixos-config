{pkgs, ...}: {

  imports = [
    ../../modules/home-manager/core.nix

    ./git/export-home.nix
    ./shell/export-home.nix
  ];

}
