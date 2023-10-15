local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  packer_bootstrap = vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup(function(use)
  -- Packer can manage itself
  use('wbthomason/packer.nvim')
  use('nvim-lua/plenary.nvim')
  use('kyazdani42/nvim-web-devicons')
  use('nvim-telescope/telescope.nvim')
  use('nvim-treesitter/nvim-treesitter-textobjects')
  use('folke/tokyonight.nvim')
  use('nvim-lualine/lualine.nvim')
  use('nvim-treesitter/nvim-treesitter')
  use('tpope/vim-fugitive')
  use('neovim/nvim-lspconfig')
  use('williamboman/mason.nvim')
  use('williamboman/mason-lspconfig.nvim')
  use('junnplus/lsp-setup.nvim')
  use('ThePrimeagen/git-worktree.nvim')
  use('github/copilot.vim')
  use('L3MON4D3/LuaSnip')
  use('hrsh7th/cmp-nvim-lsp')
  use('hrsh7th/cmp-buffer')
  use('hrsh7th/cmp-path')
  use('saadparwaiz1/cmp_luasnip')
  use('hrsh7th/nvim-cmp')
  use('hrsh7th/cmp-calc')
  use('f3fora/cmp-spell')
  use('andersevenrud/cmp-tmux')
  use('lewis6991/gitsigns.nvim')
  use('nvim-tree/nvim-tree.lua')
end)
