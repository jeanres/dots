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
      splitright = true;
      splitbelow = true;
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
      oil.enable = true;
      tmux-navigator = {
        enable = true;
      };
    };

    extraPlugins = with pkgs.vimPlugins; [
      vim-nix
      vim-fugitive
    ];

    extraConfigLua = ''
    vim.api.nvim_create_autocmd('TextYankPost', {
      desc = 'Highlight when yanking (copying) text',
      group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
      callback = function()
      vim.highlight.on_yank()
      end,
    })
    '';
  };
}
