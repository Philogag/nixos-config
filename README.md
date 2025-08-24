# My Nixos Setup

## Fresh Install

```bash
cd nixos-config

# init the disk and mount to /mnt
nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode destroy,format,mount ./hosts/test-vm/disko-config.nix

# install nixos
nixos-install --root /mnt --flake .#test-vm --no-root-password --show-trace --verbose

# copy the config into the new system
cp -r ../nixos-config /mnt/etc/nixos

# enter the new system
nixos-enter

# set the password
passwd philogag

# reboot
reboot
```

## Use tips

when update config refresh by 
```bash
sudo nixos-rebuild test --print-build-logs --verbose
sudo nixos-rebuild switch
```

## Components

+ Desktop Manager: ligntdm
+ Window Manager: KDE + hyprland

## Reference

Start with snippets from https://github.com/ryan4yin/nix-config

