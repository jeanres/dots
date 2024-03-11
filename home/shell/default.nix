{ pkgs, lib, inputs, system, config, ... }:

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
          plugin = tmuxPlugins.catppuccin;
          extraConfig = '' 
            set -g @catppuccin_flavour 'mocha'
            set -g @catppuccin_status_modules "battery session"
            set -g @catppuccin_status_left_separator "█"
            set -g @catppuccin_status_right_separator "█"
            set -g @catppuccin_date_time_text "%Y-%m-%d %H:%M:%S"
            set -g @catppuccin_window_default_fill "number"
            set -g @catppuccin_window_default_text "#W"
            set -g @catppuccin_window_current_fill "number"
            set -g @catppuccin_window_current_text "#W"
          '';
        }
        tmuxPlugins.battery
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
        set-option -g status-position top
        bind-key h select-pane -L
        bind-key j select-pane -D
        bind-key k select-pane -U
        bind-key l select-pane -R
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
