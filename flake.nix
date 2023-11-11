{
  description = "Jeanre's system configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";
    darwin = {
      url = "github:lnl7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, darwin, home-manager }: {
    darwinConfigurations = {
      "C02YN7HFLVCF" = darwin.lib.darwinSystem {
        system = "x86_64-darwin"; # use "x86_64-darwin" on pre-M1 Mac
          modules = [
          ./hosts/neon
          {
            users.users."jswanepoel".home = "/Users/jswanepoel";
          }
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.jswanepoel = { pkgs, ... }: {
            imports = [
              ./home/neovim
                ./home/shell
                ./home/terminal
            ];
            home.stateVersion = "22.05";
            dots.user = {
              name = "Jeanre Swanepoel";
              email = "jswanepoel@2u.com";
            };
          };
        }
        ];
      };
      "neon" = darwin.lib.darwinSystem {
        system = "aarch64-darwin"; # use "x86_64-darwin" on pre-M1 Mac
          modules = [
          ./hosts/neon
          {
            users.users."jeanreswanepoel".home = "/Users/jeanreswanepoel";
          }
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.jeanreswanepoel = { pkgs, ... }: {
            imports = [
              ./home/neovim
                ./home/shell
                ./home/terminal
            ];
            home.stateVersion = "22.05";
            dots.user = {
              name = "Jeanre Swanepoel";
              email = "jeanres@icloud.com";
            };
          };
        }
        ];
      };
    };
  };
}
