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

  services.nix-daemon.enable = true;

  programs.zsh.enable = true;

  homebrew = {
    enable = true;
    onActivation.autoUpdate = true;
    brews = [];
    casks = [ "docker" "obs" "discord" "slack" "microsoft-teams" "amethyst" "vladdoster/formulae/vimari" ];
  };

  fonts = {
    fontDir = {
      enable = true;
    };
    fonts = [ 
      (pkgs.nerdfonts.override { fonts = [ "VictorMono" ]; })
    ];
  };

  system = {
    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToEscape = true;
    };
  };
}
