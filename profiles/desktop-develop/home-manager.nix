{ config, pkgs, specialArgs, ... }:

{
  home.username = specialArgs.username;
  home.homeDirectory = "/home/${specialArgs.username}";

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    firefox
  ];

  programs.vscode.enable = true;
}
