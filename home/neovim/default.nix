{ inputs, pkgs, ... }:
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./plugins
  ];

  programs.nixvim = {
    enable = true;

    defaultEditor = true;

    viAlias = true;
    vimAlias = true;

    keymaps = [
      {
        mode = "n";
        key = "-";
        options.silent = true;
        action = "<cmd>Oil<CR>";
      }
      {
        mode = "n";
        key = "<Esc>";
        action = " <cmd>nohlsearch<CR>";
      }
    ];

    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    opts = {
      hlsearch = true;
      undofile = true;
      swapfile = false; # Disable the swap file
      wrap = false;
      cmdheight = 0;
      number = true; 
      relativenumber = true; 
      termguicolors = true;
      tabstop = 4;
      shiftwidth = 4;
      expandtab = true;
      autoindent = true;
      completeopt = ["menu" "menuone" "noselect"];
    };

    colorschemes.catppuccin = {
      enable = true;
    };

    clipboard = {
      register = "unnamedplus";
    };

    plugins = {
      gitsigns.enable = true;
      nvim-autopairs.enable = true;
      lualine = {
        enable = true;
        globalstatus = true;
        componentSeparators = {
          left= " ";
          right= " ";
        };
        sectionSeparators = {
          left = " ";
          right = " ";
        };
      };
      oil.enable = true;
      telescope = {
        enable = true;
        keymaps = {
          "<leader>ff" = "find_files";
          "<leader>fg" = "live_grep";
        };
      };
      tmux-navigator = {
        enable = true;
      };
    };

    extraPlugins = with pkgs.vimPlugins; [
      vim-nix
      vim-fugitive
    ];
  };
}
