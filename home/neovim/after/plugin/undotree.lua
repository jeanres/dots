require('undotree').setup({
  position = "right"
})

vim.keymap.set('n', '<leader>tu', require('undotree').toggle, { noremap = true, silent = true })

