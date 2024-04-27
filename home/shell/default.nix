{
  home.shellAliases = {
    cd = "z";
  };

  programs = {
    zsh = {
      enable = true;
      autocd = true;
      syntaxHighlighting.enable = true;
      history = {
        extended = true;
        expireDuplicatesFirst = true;
      };
      defaultKeymap = "viins";
    };

    fzf = {
      enable = true;
    };

    ripgrep.enable = true;

    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };

    eza = {
      enable = true;
    };

    direnv = {
      enable = true;
    }; 

    starship = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
