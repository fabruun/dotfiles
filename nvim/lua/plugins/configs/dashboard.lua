local opts = {
	theme = "hyper",
	-- change_to_vcs_root = true,
	mru = { limit = 10, icon = "ζ", label = "fhruun", cwd_only = false },
	config = {
		week_header = {
			enable = true,
		},
		packages = {
			enable = false,
		},
		project = { enable = true, limit = 8, icon = "ζ", label = "fhruun", action = "Telescope find_files cwd=" },
		shortcut = {
			{ desc = "󰊳 Lazy Update", group = "@property", action = "Lazy update", key = "u" },
			{ desc = "󰊳 Mason Update", group = "@property", action = "MasonUpdate", key = "m" },
			{
				icon = " ",
				icon_hl = "@variable",
				desc = "Files",
				group = "Label",
				action = "Telescope find_files",
				key = "f",
			},
			{
				desc = " Apps",
				group = "DiagnosticHint",
				action = "Telescope app",
				key = "a",
			},
			{
				desc = " dotfiles",
				group = "Number",
				action = "Telescope dotfiles",
				key = "d",
			},
		},
	},
	hide = {
		statusline = true,
		winbar = true,
		tabline = true,
	},
}

require("dashboard").setup(opts)
