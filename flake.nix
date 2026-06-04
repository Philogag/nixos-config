{
  description = "NixOS Preset Config";

  inputs = {
    nixpkgs.url = "git+https://mirrors.tuna.tsinghua.edu.cn/git/nixpkgs.git?ref=nixos-26.05&shallow=1";
    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager/release-26.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs @ { self, nixpkgs, disko, home-manager, ... }:

    let
      lib = nixpkgs.lib;
      instance = import ./instance.nix;

      systemStateVersion = "26.05";
      homeStateVersion = "26.05";

      makeNixosConfiguration = name: cfg:
        let
          select_host = cfg.select_host;
          select_profile = cfg.select_profile;
          os_arch = cfg.system;
          username = cfg.username;
          specialArgs = { inherit username; };
          sharedModule = {
            networking.hostName = name;
            system.stateVersion = systemStateVersion;
            nix.settings.substituters = [ 
              "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store" 
            ];
	    nixpkgs.config.allowUnfree = true;
          };
        in lib.nixosSystem {
          inherit specialArgs;
          system = os_arch;
          modules = [
            sharedModule
            disko.nixosModules.disko
            ./hosts/${select_host}
            ./profiles/${select_profile}/nixos.nix

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = inputs // specialArgs;
              home-manager.users.${username} = { pkgs, ... }: {
                imports = [
                  ./profiles/${select_profile}/home-manager.nix
                ];
                home.stateVersion = homeStateVersion;
              };
            }
          ];
        };

    in {
      nixosConfigurations = lib.mapAttrs makeNixosConfiguration instance;
    };
}
