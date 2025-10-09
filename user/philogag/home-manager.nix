{pkgs, ...}: {

  imports = [
    ../../modules/home-manager

    ./shell/export-home.nix
  ];
}
