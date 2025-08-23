# My Nixos Setup

## Fresh Install

sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode destroy,format,mount /tmp/disk-config.nix
nix run github:nix-community/nixos-anywhere -- --flake .#test-vm --target-host root@37.27.18.135

## Components

+ Desktop Manager: ligntdm
+ Window Manager: KDE + hyprland

## Reference

Start with snippets from https://github.com/ryan4yin/nix-config

