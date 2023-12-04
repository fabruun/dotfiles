require("telescope").load_extension("notify")
require("telescope").load_extension("noice")
local builtin = require("telescope.builtin")

local extensions = require("telescope").extensions

vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.git_files, {})
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>")
vim.keymap.set("n", "<leader>fk", builtin.keymaps, {})
vim.keymap.set("n", "<leader>fp", builtin.planets, {})
vim.keymap.set("n", "<leader>fe", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "<leader>fn", extensions.notify.notify, {})
