{ pkgs, ... }:
{
  nix = {
    package = pkgs.nixUnstable;
    extraOptions = ''
    extra-platforms = x86_64-darwin
    experimental-features = nix-command flakes
    '';
    gc = {
      automatic = true;
      interval = { Weekday = 0; Hour = 0; Minute = 0; };
      options = "--delete-older-than 30d";
    };
  };

  imports = [
    ./homebrew.nix
  ];

  services.nix-daemon.enable = true;

  programs.zsh.enable = true;

  system = {
    defaults = {
      dock = {  
        autohide = true;
        mru-spaces = false;
      };
      CustomSystemPreferences = {
        NSGlobalDomain = {
          "com.apple.Safari" = {
            IncludeDevelopMenu = true;
          };
        };
      };
      NSGlobalDomain = {
        AppleShowScrollBars = "WhenScrolling";
        _HIHideMenuBar = true; 
      };
    };
    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToEscape = true;
    };
  };
}
