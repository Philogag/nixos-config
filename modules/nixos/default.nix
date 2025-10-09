{ pkgs, username, ... }:
{
  imports = [
    ./system.nix
    ./desktop.nix
  ];
}
