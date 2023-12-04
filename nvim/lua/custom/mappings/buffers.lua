vim.keymap.set("n", "<Tab>", ":bnext<CR>", { desc = "Jump to the next buffer" })
vim.keymap.set("n", "<S-Tab>", ":bp<CR>", { desc = "Jump to the previous buffer" })
vim.keymap.set("n", "<C-x>", ":b#|bd#<CR>", { desc = "Close the current open buffent" })
