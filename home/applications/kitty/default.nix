{
  programs.kitty = {
    enable = true;

    font = {
      name = "Victor Mono Nerd Font";
      size = 14;
    };

    theme = "Catppuccin-Mocha";

    extraConfig = ''
      window_margin_width 5
      window_padding_width 5
      hide_window_decorations yes
    '';
  };
}
