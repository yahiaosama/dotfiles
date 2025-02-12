-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
-- Key mappings for buffer navigation
-- Scroll through buffers with Tab and Shit Tab
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { noremap = true, silent = true })


-- Toggle between light and dark theme
local is_dark = true

local function toggle_theme()
  if is_dark then
    vim.o.background = "light"
    os.execute("kitten themes --reload-in=all Tokyo Night Day")
  else
    vim.o.background = "dark"
    os.execute("kitten themes --reload-in=all Tokyo Night Moon")
  end
  is_dark = not is_dark
end

vim.keymap.set("n", "<leader>ut", toggle_theme, { desc = "Toggle Theme" })
