{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    prefix = "C-space";
    baseIndex = 1;
    extraConfig = ''
    set-option -g status-position top
    set -g status-interval 5
    set -g automatic-rename on
    set -g automatic-rename-format '#{pane_current_command}'
    '';
    plugins = with pkgs; [
      tmuxPlugins.vim-tmux-navigator
      {
        plugin = tmuxPlugins.resurrect;
        extraConfig = ''
        set -g @resurrect-strategy-vim 'session'
        set -g @resurrect-strategy-nvim 'session'
        set -g @resurrect-capture-pane-contents 'on'
        '';
      }
      {
        plugin = tmuxPlugins.continuum;
        extraConfig = ''
        set -g @continuum-restore 'on'
        set -g @continuum-save-interval '60' # minutes
        '';
      }
      {
        plugin = tmuxPlugins.catppuccin;
        extraConfig = ''
        set -g @catppuccin_flavour 'mocha'
        set -g @catppuccin_status_left_separator "█"
        set -g @catppuccin_status_right_separator "█"
        set -g @catppuccin_window_current_text "#W"
        set -g @catppuccin_window_default_text "#W"
        '';
      }
    ];
  };
}
