{
  lib,
  inputs,
  self,
  ...
}:
{
  flake.darwinConfigurations.hrk = inputs.nix-darwin.lib.darwinSystem {
    specialArgs = { inherit inputs; };
    modules = [
      inputs.mac-app-util.darwinModules.default

      self.darwinModules.default

      {
        system.stateVersion = 4;
        nixpkgs.hostPlatform = lib.systems.examples.aarch64-darwin;
        imports = with self.darwinModules.configurations; [
          fish
          fonts
          networking
          settings
          skhd
          sudo
          users
          yabai
        ];
        networking.hostName = lib.mkDefault "hrk";
      }

      inputs.home-manager.darwinModules.home-manager
      {
        config.users.users.grimerssy = {
          name = "grimerssy";
          home = "/Users/grimerssy";
          createHome = true;
          isHidden = false;
        };
        config.home-manager = {
          extraSpecialArgs = { inherit inputs; };
          useGlobalPkgs = true;
          sharedModules = [
            inputs.mac-app-util.homeManagerModules.default
            ../home
          ];
          users.grimerssy = {
            home.stateVersion = "24.11";
            imports = [
              ../home/configuration
            ];
            programs.git = {
              userName = "Stanislav Stoyanov";
              userEmail = "grimerssy@gmail.com";
            };
          };
        };
      }

      {
        nixpkgs.config.allowUnfree = true;
        nix =
          let
            mapFlakes =
              f:
              lib.mapAttrs f {
                inherit (inputs)
                  nixpkgs
                  nixpkgs-stable
                  nixpkgs-unstable
                  flakes
                  ;
                system = inputs.self;
              };

          in
          {
            enable = true;
            optimise.automatic = true;
            registry = mapFlakes (_: flake: { inherit flake; });
            nixPath = mapFlakes (_: x: x);
            settings = {
              flake-registry = "";
              experimental-features = "nix-command flakes";
            };
            gc = {
              automatic = true;
              options = "--delete-older-than 30d";
            };
          };
      }
    ];
  };
}
