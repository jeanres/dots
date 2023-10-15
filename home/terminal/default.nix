{ pkgs, inputs, system, ... }:

{
  programs.kitty = {
    enable = true;
    font = {
      name = "VictorMono Nerd Font";
      size = 16;
    };

    theme = "Tokyo Night"; # TODO: Pick a theme

    settings = {
      enable_audio_bell = false;
    };
  };
}
