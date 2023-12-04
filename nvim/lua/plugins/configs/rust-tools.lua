local capabilities = require("cmp_nvim_lsp").default_capabilities()

local options = {
	server = {
		capabilities = capabilities,
	},
}

return options
