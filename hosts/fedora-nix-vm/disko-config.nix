{
  disko.devices = {
    esp = {
      type = "partition";
      device = "/dev/sda1"; # or you can use /dev/disk/by-uuid/<id> to lock disk
      content = {
        type = "filesystem";
        format = "vfat";
        mountpoint = "/boot/efi";
      };
    };

    boot = {
      type = "partition";
      device = "/dev/sda2";
      content = {
        type = "filesystem";
        format = "ext4";
        mountpoint = "/boot";
      };
    };

    btrfs-root = {
      type = "partition";
      device = "/dev/sda3";
      content = {
        type = "btrfs";
        subvolumes = {
          "nixos/root" = {
            mountpoint = "/";
            mountOptions = [ "compress=zstd" ];
          };
          "nixos/nix" = {
            mountpoint = "/nix";
            mountOptions = [ "compress=zstd" ];
          };
          "nixos/home" = {
            mountpoint = "/home";
            mountOptions = [ "compress=zstd" ];
          };
        };
      };
    };
  };
}
