{ inputs, pkgs, lib, ... }:
{
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
      luasnip.enable = true;
      lspkind = {
        enable = true;
        cmp = {
          enable = true;
          menu = {
            nvim_lsp = "[LSP]";
            nvim_lua = "[api]";
            path = "[path]";
            luasnip = "[snip]";
            buffer = "[buffer]";
          };
        };
      };
      cmp = {
        enable = true;

        settings = {
          snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";

          mapping = {
            "<C-d>" = "cmp.mapping.scroll_docs(-4)";
            "<C-f>" = "cmp.mapping.scroll_docs(4)";
            "<C-Space>" = "cmp.mapping.complete()";
            "<C-e>" = "cmp.mapping.close()";
            "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
            "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
          };

          sources = [
            {name = "path";}
            {name = "nvim_lsp";}
            {name = "luasnip";}
            {
              name = "buffer";
              # Words from other open buffers can also be suggested.
              option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
            }
          ];
        };
      };
      oil.enable = true;
      treesitter.enable = true; 
      lsp = {
        enable = true;

        keymaps = {
          silent = true;
          diagnostic = {
            "<leader>k" = "goto_prev";
            "<leader>j" = "goto_next";
          };

          lspBuf = {
            gd = "definition";
            gD = "references";
            gt = "type_definition";
            gi = "implementation";
            K = "hover";
            rn = "rename";
          };
        };

        servers = {
          omnisharp.enable = true;
        };
      };
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
    ];
  };
}
