require("duckytype").setup({
	number_of_words = 25,
	highlight = {
		good = "Comment",
		bad = "Error",
		remaining = "Todo",
	},
})

vim.keymap.set("n", "<A-d>", ":DuckyType<CR>")
