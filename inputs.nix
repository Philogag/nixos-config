let
  version = import ./version.nix;
in {
  nixpkgs.url = "git+https://mirrors.tuna.tsinghua.edu.cn/git/nixpkgs.git?ref=nixos-${version.nixos}&shallow=1";
  disko.url = "github:nix-community/disko";
  disko.inputs.nixpkgs.follows = "nixpkgs";
  home-manager.url = "github:nix-community/home-manager/release-${version.home-manager}";
  home-manager.inputs.nixpkgs.follows = "nixpkgs";
}
