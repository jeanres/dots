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
      "neon" = darwin.lib.darwinSystem {
        system = "aarch64-darwin"; # use "x86_64-darwin" on pre-M1 Mac
          modules = [
          ./hosts/neon
          {
            users.users."jeanres".home = "/Users/jeanres";
          }
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.jeanres = { pkgs, ... }: {
            imports = [
              ./home/neovim
                ./home/shell
                ./home/terminal
            ];
            home.stateVersion = "23.05";
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
