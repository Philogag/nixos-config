{ config, pkgs, specialArgs, ... }:

{
  home.username = specialArgs.username;
  home.homeDirectory = "/home/${specialArgs.username}";
  home.stateVersion = specialArgs.version.home-manager;

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    steam
  ];
}
