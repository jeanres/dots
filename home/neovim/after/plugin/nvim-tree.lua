require("nvim-tree").setup({
  view = {
    side = "left"
  },
  diagnostics = {
    enable = true
  },
  renderer = {
    root_folder_label = false,
    indent_markers = {
      enable = true,
    },
  },
  filters = { 
    custom = { "^.git$", "^.idea$", "^.direnv$" } 
  },
})

vim.keymap.set('n', '<leader>b', ':NvimTreeToggle<CR>', {})

vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
      vim.cmd "quit"
    end
  end
})
