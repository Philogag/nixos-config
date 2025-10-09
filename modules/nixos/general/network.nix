{ pkgs, lib, ... }:

{
  networking.networkmanager.enable = true;

  # NetworkManager plugins for KDE Plasma Desktop 
  environment.systemPackages = with pkgs; [
    kdePackages.networkmanager-qt
    kdePackages.modemmanager-qt
    kdePackages.plasma-nm
  ];
}
