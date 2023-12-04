return {
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp",
	},
	{
		"ThePrimeagen/harpoon",
		config = function()
			require("plugins.configs.harpoon")
		end,
	},
	-- init.lua:
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.3",
		-- or                              , branch = '0.1.x',
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("plugins.configs.telescope")
		end,
	},
	{ "williamboman/mason.nvim" },
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("plugins.configs.lspconfig")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = {
			{ "elgiano/nvim-treesitter-angular", branch = "topic/jsx-fix" },
		},
		config = function()
			require("plugins.configs.treesitter")
		end,
	},
	{
		"haorenW1025/completion-nvim",
		"nvim-treesitter/completion-treesitter",
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },
		},
	},

	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			{ "L3MON4D3/LuaSnip" },
		},
	},
	{
		"kdheepak/lazygit.nvim",
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("plugins.configs.lazygit")
		end,
	},
	{
		"folke/zen-mode.nvim",
		config = function()
			require("plugins.configs.zenmode")
		end,
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			{
				"rcarriga/nvim-notify",
				config = function()
					require("plugins.configs.notify")
					-- this for transparency
					-- this overwrites the vim notify function
				end,
			},
		},
		config = function()
			require("plugins.configs.noice")
		end,
	},
	{
		"SmiteshP/nvim-navic",
		dependencies = {
			"neovim/nvim-lspconfig",
		},
	},
	{
		"nvim-neorg/neorg",
		build = ":Neorg sync-parsers",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("plugins.configs.neorg")
		end,
	},
	{
		"linrongbin16/lsp-progress.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("plugins.configs.lsp-progress")
		end,
	},
	{
		"m4xshen/autoclose.nvim",
		config = function()
			require("plugins.configs.autoclose")
		end,
	},
	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("plugins.configs.refactoring")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("plugins.configs.lualine")
		end,
	},
	{
		"ixru/nvim-markdown",
		config = function()
			require("plugins.configs.markdown")
		end,
	},
	{
		"mbbill/undotree",
		config = function()
			require("plugins.configs.undotree")
		end,
	},
	{
		"mhartington/formatter.nvim",
		config = function()
			require("plugins.configs.formatter")
		end,
	},
	{
		-- Themes
		{
			-- Theme switcher
			"zaldih/themery.nvim",
		},
		"ray-x/aurora",
		{
			"catppuccin/nvim",
			name = "catppuccin",
			priority = 1000,
			config = function()
				require("plugins.configs.catppuccin")
			end,
		},
		"rebelot/kanagawa.nvim",
		{ "rose-pine/neovim", name = "rose-pine" },
		{ "savq/melange-nvim" },
	},
	"saadparwaiz1/cmp_luasnip",
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("plugins.configs.copilot")
		end,
	},
	{
		"zbirenbaum/copilot-cmp",
	},
	-- Finally <3
	{
		"nvimtools/none-ls.nvim",
		ft = {
			"json",
			"go",
			"lua",
			"javascript",
			"typescript",
			"bash",
			"php",
			"sql",
			"java",
			"html",
			"css",
		},
		dependencies = {
			"neovim/nvim-lspconfig",
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("plugins.configs.none-ls")
		end,
	},
	{
		-- gitsigns
		"lewis6991/gitsigns.nvim",
		config = function()
			require("plugins.configs.gitsigns")
		end,
	},
	"jose-elias-alvarez/nvim-lsp-ts-utils",
	"gpanders/nvim-parinfer",
	{
		"onsails/lspkind.nvim",
		config = function()
			require("plugins.configs.lspkind")
		end,
	},
	{
		"rust-lang/rust.vim",
		ft = "rust",
		init = function()
			vim.g.rustfmt_autosave = 1
		end,
	},
	{
		"simrat39/rust-tools.nvim",
		ft = "rust",
		dependencies = "neovim/nvim-lspconfig",
		opts = function()
			require("plugins.configs.rust-tools")
		end,
		config = function(_, opts)
			require("rust-tools").setup(opts)
		end,
	},
	{
		"mfussenegger/nvim-dap",
	},
	{
		"mfussenegger/nvim-jdtls",
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
		},
		config = function()
			require("plugins.configs.dapui")
		end,
	},
	{
		"rest-nvim/rest.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("plugins.configs.rest")
		end,
	},
	{
		"gbprod/phpactor.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required to update phpactor
			"neovim/nvim-lspconfig", -- required to automatically register lsp serveur
		},
	},
	{
		"unblevable/quick-scope",
		init = function()
			require("plugins.configs.quickscope")
		end,
	},
	{
		"adalessa/laravel.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"tpope/vim-dotenv",
			"MunifTanjim/nui.nvim",
		},
		cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
		keys = {
			{ "<leader>la", ":Laravel artisan<cr>" },
			{ "<leader>lr", ":Laravel routes<cr>" },
			{ "<leader>lm", ":Laravel related<cr>" },
			{
				"<leader>lt",
				function()
					require("laravel.tinker").send_to_tinker()
				end,
				mode = "v",
				desc = "Laravel Application Routes",
			},
		},
		event = { "VeryLazy" },
		config = function()
			require("laravel").setup()
			require("telescope").load_extension("laravel")
		end,
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		config = function()
			require("plugins.configs.which-key")
		end,
	},
	{
		"https://gitlab.com/itaranto/plantuml.nvim",
		version = "*",
		config = function()
			require("plugins.configs.plantuml")
		end,
	},
	{
		"numToStr/Comment.nvim",
		lazy = false,
		config = function()
			require("plugins.configs.comment")
		end,
	},
	{
		"Arekkusuva/jira-nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
		build = "make build",
		config = function()
			require("plugins.configs.jira")
		end,
	},
	{
		"stevearc/oil.nvim",
		config = function()
			require("plugins.configs.oil")
		end,
	},
	{
		"wakatime/vim-wakatime",
	},
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("plugins.configs.dashboard")
		end,
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"kwakzalver/duckytype.nvim",
		config = function()
			require("plugins.configs.duckytype")
		end,
	},
	{
		"rmagatti/auto-session",
		config = function()
			require("plugins.configs.auto-session")
		end,
	},
}
