require("custom.theme.themery")

vim.o.termguicolors = true
vim.api.nvim_set_hl(0, "Normal", { bg = "None" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "None" })
vim.cmd("colorscheme rose-pine-main")
