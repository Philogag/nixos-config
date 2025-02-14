{pkgs, ...}: {

  imports = [
    ../core.nix

    ./git
    ./shell
  ];

}
