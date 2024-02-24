vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.scrolloff = 10
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.wrap = false
vim.opt.laststatus = 3
vim.opt.termguicolors = true
vim.opt.swapfile = false
vim.opt.cmdheight = 0
vim.opt.clipboard = "unnamedplus"
vim.o.hlsearch = false
vim.opt.cursorline = true
vim.g.mapleader = " "

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
keymap("n","<leader>gb","Gitsigns toggle_current_line_blame" ,opts)

