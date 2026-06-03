{
  description = "NixOS Preset Config";

  inputs = import ./inputs.nix;

  outputs = inputs @ { self, nixpkgs, disko, home-manager, ... }:

    let
      lib = nixpkgs.lib;
      version = import ./version.nix;
      instance = import ./instance.nix;

      makeNixosConfiguration = name: cfg:
        let
          select_profile = cfg.select_profile;
          system = cfg.system;
          username = cfg.username;
          specialArgs = { inherit username version; };
          sharedModule = {
            networking.hostName = name;
            system.stateVersion = version.nixos;
            nix.settings.substituters = [ "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store" ];
          };
        in lib.nixosSystem {
          inherit specialArgs;
          system = ${system};
          modules = [
            sharedModule
            ./hosts/${name}
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
              };
            }
          ];
        };

    in {
      nixosConfigurations = lib.mapAttrs makeNixosConfiguration instance;
    };
}
