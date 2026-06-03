{ config, pkgs, specialArgs, ... }:

{
  users.users.${specialArgs.username} = {
    isNormalUser = true;
    description = specialArgs.username;
    extraGroups = [ "wheel" "networkmanager" ];
  };

  services = {
    desktopManager.plasma6.enable = true;
    displayManager.sddm.enable = true;
    displayManager.sddm.wayland.enable = true;
    pipewire.enable = lib.mkForce false;
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

  services.nfs-server.enable = true;
  services.smbd.enable = true;
}
