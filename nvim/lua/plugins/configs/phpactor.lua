local capabilities = require("cmp_nvim_lsp").default_capabilities()
local on_attach = require("cmp_nvim_lsp").on_attach

require("phpactor").setup({
	install = {
		branch = "master",
		bin = "/bin/phpactor",
		php_bin = "php",
		composer_bin = "composer",
		git_bin = "git",
		check_on_startup = "none",
	},
	lspconfig = {
		enabled = true,
		options = {
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				["phpactor.php_code_sniffer.bin"] = "%project_path%/vendor/bin/phpcs",
				["phpactor.php_code_sniffer.enabled"] = true,
				["phpactor.php_cs_fixer.bin"] = "%project_path%/tools/php-cs-fixer/vendor/bin/php-cs-fixer",
				["phpactor.php_cs_fixer.enabled"] = true,
				["phpactor.php_stan.enabled"] = true,
			},
		},
	},
})
