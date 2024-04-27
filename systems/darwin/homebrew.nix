{ ... }:
{
  homebrew = {
    enable = true;
    global = {
      autoUpdate = true;
    };
    onActivation = {
      autoUpdate = true;
      upgrade = true;
    };
    brews = [ 
    ];
    casks = [
      "amethyst"
      "vladdoster/formulae/vimari"
    ];
    masApps = {
    };
  };
}
