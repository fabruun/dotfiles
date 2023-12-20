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

-- Cobol variables

-- Free modern cobol syntax
-- g.cobol_syntax_checker_cobc_compiler_option = '-free'

-- Traditional old cobol syntax (default)
g.cobol_syntax_checker_cobc_compiler_option = ""

-- Check syntax when open cobol file (default)
g.cobol_syntax_checker_check_on_read = 1

-- Check syntax when save cobol file (default)
g.cobol_syntax_checker_check_on_write = 1

-- Auto open/close location list (default)
g.cobol_syntax_checker_loc_auto_open_close = 1
