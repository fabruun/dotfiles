vim.keymap.set("n", "<leader>gtc", function()
	vim.cmd("e" .. "~/code/")
end, { desc = "Go to code" })
vim.keymap.set("n", "<leader>gtp", function()
	vim.cmd("e" .. "~/.config/nvim/lua/plugins/init.lua")
end, { desc = "Go to plugins" })

vim.keymap.set("n", "<leader>gtl", function()
	vim.cmd("e " .. "~/.config/nvim/lua/plugins/configs/lspconfig.lua")
end, { desc = "Go to lspconfig" })

vim.keymap.set("n", "<leader>gtm", function()
	vim.cmd("e " .. "~/.config/nvim/lua/custom/mappings/init.lua")
end, { desc = "Go to mappings" })

vim.keymap.set("n", "<leader>T", function()
	vim.cmd("e " .. "~/.config/nvim/lua/plugins/configs/treesitter/init.lua")
end, { desc = "Go to treesitter" })

vim.keymap.set("n", "<leader>t", vim.cmd.Themery, { desc = "Open theme switcher" })

vim.keymap.set("n", "<leader>gtn", function()
	vim.cmd("e " .. "~/.config/nvim/lua/plugins/configs/none-ls.lua")
end, { desc = "Go to nonels" })
