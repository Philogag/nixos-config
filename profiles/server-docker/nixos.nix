{ config, pkgs, specialArgs, ... }:

{
  users.users.${specialArgs.username} = {
    isNormalUser = true;
    description = specialArgs.username;
    extraGroups = [ "wheel" "networkmanager" ];
  };

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  virtualisation.docker.enable = true;

  environment.systemPackages = with pkgs; [
    git
    vim
    curl
    wget
    tree
    htop
    ncdu
  
    docker-compose
  ];
}
