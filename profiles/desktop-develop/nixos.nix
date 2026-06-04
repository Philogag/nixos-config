{ config, pkgs, specialArgs, ... }:

{
  users.users.${specialArgs.username} = {
    isNormalUser = true;
    description = specialArgs.username;
    extraGroups = [ "wheel" "networkmanager" "docker" ];
  };

  services = {
    desktopManager.plasma6.enable = true;
    displayManager.sddm.enable = true;
    displayManager.sddm.wayland.enable = true;
    pipewire.enable = true;
  };

  # this profile is using for develop, for continence we simply disable the firewall
  networking.firewall.enable = false;

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

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

  virtualisation.docker.enable = true;

  services.openssh = {
    enable = true;
    openFirewall = true;
  };
}
