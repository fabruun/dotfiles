require("custom.theme.themery")

function ThemeColor(color)
	color = color or "rose-pine"
	vim.o.termguicolors = true
	vim.cmd("colorscheme " .. color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "None" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "None" })
end

ThemeColor()
