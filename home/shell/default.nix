{ pkgs, lib, input, config, ... }:

with lib;
let
  user = config.dots.user;
in
{
  options.dots.user = {
    name = mkOption {
      type = types.str;
      description = "The user's name";
    };

    email = mkOption {
      type = types.str;
      description = "The user's email address";
    };
  };

  config = {
    home.sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };

    programs.irssi = {
      enable = true;
    };

    programs.ssh = {
      enable = true;
      matchBlocks = {
        "*" = {
          extraOptions = {
            IgnoreUnknown = "UseKeyChain";
            UseKeychain = "yes";
          };
        };
      };
    };

    programs.zsh = {
      enable = true;
      autocd = true;
      syntaxHighlighting = {
        enable = true;
      };
      history = {
        extended = true;
        expireDuplicatesFirst = true;
      };
      shellAliases = {
        cd = "z";
      };
      initExtra = ''
        bindkey -v
      '';
    };

    programs.eza = {
      enable = true;
      enableAliases = true;
    };

    programs.bat.enable = true;

    programs.zoxide = {
      enable = true;
      enableZshIntegration = true;
    };

    programs.fzf = {
      enable = true;
      enableZshIntegration = true;
    };

    programs.jq.enable = true;

    programs.tmux = {
      enable = true;
      prefix = "C-Space";
      escapeTime = 0;
      baseIndex = 1;
      keyMode = "vi";
      plugins = with pkgs;
      [
        {
          plugin = tmuxPlugins.resurrect;
          extraConfig = "set -g @resurrect-strategy-nvim 'session'";
        }
        {
          plugin = tmuxPlugins.continuum;
          extraConfig = ''
            set -g @continuum-restore 'on'
            set -g @continuum-save-interval '60' # minutes
          '';
        }
      ];
      extraConfig = ''
        set -g default-terminal "tmux-256color" 
        set-option -g renumber-windows on
        bind t 'popup'
        bind-key h select-pane -L
        bind-key j select-pane -D
        bind-key k select-pane -U
        bind-key l select-pane -R

        set-option -g status-position top

        set -g mode-style "fg=#7aa2f7,bg=#3b4261"

        set -g message-style "fg=#7aa2f7,bg=#3b4261"
        set -g message-command-style "fg=#7aa2f7,bg=#3b4261"

        set -g pane-border-style "fg=#3b4261"
        set -g pane-active-border-style "fg=#7aa2f7"

        set -g status "on"
        set -g status-justify "left"

        set -g status-style "fg=#7aa2f7,bg=#16161e"

        set -g status-left-length "100"
        set -g status-right-length "100"

        set -g status-left-style NONE
        set -g status-right-style NONE

        set -g status-left "#[fg=#15161e,bg=#7aa2f7,bold] #S #[fg=#7aa2f7,bg=#16161e,nobold,nounderscore,noitalics]"
        set -g status-right "#[fg=#16161e,bg=#16161e,nobold,nounderscore,noitalics]#[fg=#7aa2f7,bg=#16161e] #{prefix_highlight} #[fg=#3b4261,bg=#16161e,nobold,nounderscore,noitalics]#[fg=#7aa2f7,bg=#3b4261] %Y-%m-%d | %I:%M %p #[fg=#7aa2f7,bg=#3b4261,nobold,nounderscore,noitalics]#[fg=#15161e,bg=#7aa2f7,bold] #h "
        if-shell '[ "$(tmux show-option -gqv "clock-mode-style")" == "24" ]' {
          set -g status-right "#[fg=#16161e,bg=#16161e,nobold,nounderscore,noitalics]#[fg=#7aa2f7,bg=#16161e] #{prefix_highlight} #[fg=#3b4261,bg=#16161e,nobold,nounderscore,noitalics]#[fg=#7aa2f7,bg=#3b4261] %Y-%m-%d | %H:%M #[fg=#7aa2f7,bg=#3b4261,nobold,nounderscore,noitalics]#[fg=#15161e,bg=#7aa2f7,bold] #h "
        }

        setw -g window-status-activity-style "underscore,fg=#a9b1d6,bg=#16161e"
        setw -g window-status-separator ""
        setw -g window-status-style "NONE,fg=#a9b1d6,bg=#16161e"
        setw -g window-status-format "#[fg=#16161e,bg=#16161e,nobold,nounderscore,noitalics]#[default] #I:#W #F #[fg=#16161e,bg=#16161e,nobold,nounderscore,noitalics]"
        setw -g window-status-current-format "#[fg=#16161e,bg=#3b4261,nobold,nounderscore,noitalics]#[fg=#7aa2f7,bg=#3b4261,bold] #I:#W #F #[fg=#3b4261,bg=#16161e,nobold,nounderscore,noitalics]"

# tmux-plugins/tmux-prefix-highlight support
        set -g @prefix_highlight_output_prefix "#[fg=#e0af68]#[bg=#16161e]#[fg=#16161e]#[bg=#e0af68]"
        set -g @prefix_highlight_output_suffix ""
      '';
    };

    programs.git = {
      enable = true;
      userEmail = user.email;
      userName = user.name;
      extraConfig = {
        init = {
          defaultBranch = "main";
        };
        merge = {
          ff = "only";
        };
        pull = {
          rebase = true;
        };
        rebase = {
          autoSquash = true;
          autoStash = true;
        };
        commit = {
          verbose = true;
        };
        url = {
          "ssh://git@github.com/" = {
            insteadOf = [ "github:" "gh:" "git://github.com/" ];
          };
        };
      };
    };

    programs.starship = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        add_newline = false;
      };
    };

    programs.direnv.enable = true;
  };
}
