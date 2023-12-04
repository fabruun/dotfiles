require("harpoon").setup({
	menu = {
		width = math.ceil(vim.api.nvim_win_get_width(0) * 0.66),
		border_radius = 0,
	},
	global_settings = {
		-- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
		save_on_toggle = false,

		-- saves the harpoon file upon every change. disabling is unrecommended.
		save_on_change = true,

		-- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
		enter_on_sendcmd = false,

		-- closes any tmux windows harpoon that harpoon creates when you close Neovim.
		tmux_autoclose_windows = false,

		-- filetypes that you want to prevent from adding to the harpoon list menu.
		excluded_filetypes = { "harpoon" },

		-- set marks specific to each git branch inside git repository
		mark_branch = false,

		-- enable tablin with harpoon marks
		tabline = tabline,
		tabline_prefix = "   ",
		tabline_suffix = "   ",
	},
})

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<C-e>", function()
	ui.toggle_quick_menu()
end)
vim.keymap.set("n", "<leader>a", function()
	mark.add_file()
end)

vim.keymap.set("n", "<C-n>", function()
	ui.nav_file(1)
end)
vim.keymap.set("n", "<C-t>", function()
	ui.nav_file(2)
end)
vim.keymap.set("n", "<C-s>", function()
	ui.nav_file(3)
end)
vim.keymap.set("n", "<C-a>", function()
	ui.nav_file(4)
end)
vim.keymap.set("n", "<C-l>", function()
	ui.nav_file(5)
end)
vim.keymap.set("n", "<C-p>", function()
	ui.nav_file(6)
end)
vim.keymap.set("n", "<C-y>", function()
	ui.nav_file(7)
end)
vim.keymap.set("n", "<C-;>", function()
	ui.nav_file(8)
end)

vim.cmd("highlight! HarpoonInactive guibg=NONE guifg=#63698c")
vim.cmd("highlight! HarpoonActive guibg=NONE guifg=white")
vim.cmd("highlight! HarpoonNumberActive guibg=NONE guifg=#7aa2f7")
vim.cmd("highlight! HarpoonNumberInactive guibg=NONE guifg=#7aa2f7")
vim.cmd("highlight! TabLineFill guibg=NONE guifg=white")
