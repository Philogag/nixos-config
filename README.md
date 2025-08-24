# My Nixos Setup

## Fresh Install

```
cd nixos-config

# init the disk and mount to /mnt
nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode destroy,format,mount ./hosts/test-vm/disko-config.nix

# install nixos
nixos-install --root /mnt --flake .#ai --no-root-password --show-trace --verbose
```

## Components

+ Desktop Manager: ligntdm
+ Window Manager: KDE + hyprland

## Reference

Start with snippets from https://github.com/ryan4yin/nix-config

