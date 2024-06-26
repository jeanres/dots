{
  description = "Jeanre's system configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    darwin = {
      url = "github:lnl7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, darwin, home-manager, nixvim } @inputs: {
    darwinConfigurations = {
      carbon = darwin.lib.darwinSystem {
        system = "x86_64-darwin"; 
        modules = [
          ./systems/darwin
          {
            users.users."jeanre".home = "/Users/jeanre";
          }
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.useUserPackages = true;

            home-manager.users."jeanre" = { pkgs, ... }: {
              imports = [
                ./home/neovim	
                ./home/tools/git 
                ./home/applications
                ./home/system/fonts
                ./home/shell
                ./home/tmux
              ];
              home.stateVersion = "24.05";
            };
          }
        ];
      };
      neon = darwin.lib.darwinSystem {
        system = "aarch64-darwin"; 
        modules = [
          ./systems/darwin
          {
            users.users."jeanre".home = "/Users/jeanre";
          }
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.useUserPackages = true;

            home-manager.users."jeanre" = { pkgs, ... }: {
              imports = [
                ./home/neovim	
                ./home/tools/git 
                ./home/applications
                ./home/system/fonts
                ./home/shell
                ./home/tmux
              ];
              home.stateVersion = "24.05";
            };
          }
        ];
      };
    };
  };
}
