require("neorg").setup({
	load = {
		["core.defaults"] = {},
		["core.concealer"] = {},
		["core.dirman"] = {
			config = {
				workspaces = {
					work = "~/notes/work",
					home = "~/notes/home",
				},
			},
		},
	},
})

vim.wo.foldlevel = 99
vim.wo.conceallevel = 2

vim.keymap.set("n", "<leader>nw", ":Neorg workspace work<CR>")
vim.keymap.set("n", "<leader>nh", ":Neorg workspace home<CR>")
