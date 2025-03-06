if vim.g.neovide then
  vim.g.neovide_cursor_vfx_mode = "railgun"
  vim.g.neovide_fullscreen = true

  vim.keymap.set("v", "<C-c>", '"+y') -- Copy
  vim.keymap.set("n", "<C-S-v>", '"+P') -- Paste normal mode
  vim.keymap.set("v", "<C-S-v>", '"+P') -- Paste visual mode
  vim.keymap.set("c", "<C-S-v>", "<C-R>+") -- Paste command mode
  vim.keymap.set("i", "<C-S-v>", "<C-R>+") -- Paste insert mode
  vim.keymap.set("i", "<C-S-v>", "<C-R>+") -- Paste insert mode
  vim.keymap.set("t", "<C-S-v>", "<Esc><Esc><cmd>put +<cr>") -- Paste insert mode
end
