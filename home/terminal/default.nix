{ pkgs, inputs, system, ... }:

{
  programs.kitty = {
    enable = true;

    font = {
      name = "VictorMono Nerd Font";
      size = 16;
    };

    theme = "Tokyo Night";

    settings = {
      enable_audio_bell = false;
      copy_on_select = true;
    };

    extraConfig = ''
      italic_font      VictorMono Nerd Font Light Italic
      bold_italic_font VictorMono Nerd Font Bold Italic
      window_padding_width 0
      hide_window_decorations yes
      window_border_width 0
      draw_minimal_borders yes 
    '';
  };
}
