{
  description = "NixOS config of philogag";

  nixConfig = {
    extra-substituters = [
      "https://mirror.sjtu.edu.cn/nix-channels/store"
    ];
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs @ { self, nixpkgs, home-manager, ... }: {

    nixosConfigurations = {
      test-vm = let
        username = "philogag";
        specialArgs = {inherit username;};
      in nixpkgs.lib.nixosSystem { 
        inherit specialArgs;
        system = "x86_64-linux";
        modules = [
          ./hosts/test-vm
          ./user/${username}/nixos.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = inputs // specialArgs;
            home-manager.users.${username} = import ./user/${username}/home.nix;
          }
        ];
      };
    };
  };
}
