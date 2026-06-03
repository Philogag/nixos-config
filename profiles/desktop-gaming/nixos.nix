{ pkgs, ... }:

{
  users.users.${specialArgs.username} = {
    isNormalUser = true;
    description = specialArgs.username;
    extraGroups = [ "wheel" "networkmanager" ];
  };

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
  ];
}
