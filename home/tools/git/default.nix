{
  programs = {
    git = {
      enable = true;

      userEmail = "jeanres@icloud.com";
      userName = "Jeanre Swanepoel";

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
        diff = {
          tool = "vimdiff";
        };
      };
    };
  };

  home.shellAliases = {
    gs = "git status";
  };
}
