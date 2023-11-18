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
      enableSyntaxHighlighting = true;
      history = {
        extended = true;
        expireDuplicatesFirst = true;
      };
    };

    programs.exa = {
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
      extraConfig = ''
        set -g default-terminal "tmux-256color" 
        set-option -g renumber-windows on
        set-option -g status-position top
        bind t 'popup'

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
