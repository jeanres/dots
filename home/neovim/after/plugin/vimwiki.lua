local icloud_vimwiki_path = "~/Documents/vimwiki"

vim.g.vimwiki_list = {
  {
    path = icloud_vimwiki_path,
    syntax = 'markdown',  -- or 'media' based on your preference
    ext = '.md',
  }
}
