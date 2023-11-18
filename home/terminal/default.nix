{ pkgs, inputs, system, ... }:

{
  programs.kitty = {
    enable = true;

    font = {
      name = "VictorMono Nerd Font";
      size = 16;
    };

    theme = "Rosé Pine Moon"; # TODO: Pick a theme

    settings = {
      enable_audio_bell = false;
      copy_on_select = true;
    };

    extraConfig = ''
      italic_font      VictorMono Nerd Font Light Italic
      bold_italic_font VictorMono Nerd Font Bold Italic
    '';
  };
}
