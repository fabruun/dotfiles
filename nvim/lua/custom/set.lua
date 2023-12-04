local opt = vim.opt
local g = vim.g
local s = vim.api.nvim_set_keymap

opt.nu = true
opt.relativenumber = true

opt.softtabstop = 4
opt.tabstop = 4
opt.shiftwidth = 4
opt.smartindent = true
opt.expandtab = true
opt.wrap = true

opt.guicursor = ""
opt.termguicolors = true

opt.swapfile = false

opt.updatetime = 1000

opt.colorcolumn = "80"

opt.hlsearch = true
opt.incsearch = true

g.netrw_keepdir = 0
g.netrw_winsize = 30
g.netrw_banner = 0
g.netrw_localcopydircmd = "cp -r"

g.markdown_fenced_languages = {
	"ts=typescript",
}
