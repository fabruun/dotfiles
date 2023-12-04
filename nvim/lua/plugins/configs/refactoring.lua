require("refactoring").setup({
	prompt_func_return_type = {
		php = true,
		lua = true,
		java = true,

		cpp = false,
		c = false,
		h = false,
		hpp = false,
		cxx = false,
	},
	prompt_func_param_type = {
		php = true,
		lua = true,
		java = true,

		cpp = false,
		c = false,
		h = false,
		hpp = false,
		cxx = false,
	},
	printf_statements = {},
	print_var_statements = {
		php = "sprintf('%s %s %s')",
	},
})

vim.keymap.set("x", "<leader>re", function()
	require("refactoring").refactor("Extract Function")
end, { desc = "Refactor: Extract Function" })
vim.keymap.set("x", "<leader>rf", function()
	require("refactoring").refactor("Extract Function To File")
end, { desc = "Refactor: Extract Function To File" })
-- Extract function supports only visual mode
vim.keymap.set("x", "<leader>rv", function()
	require("refactoring").refactor("Extract Variable")
end, { desc = "Refactor: Extract Variable" })
-- Extract variable supports only visual mode
vim.keymap.set("n", "<leader>rI", function()
	require("refactoring").refactor("Inline Function")
end, { desc = "Refactor Inline Function" })
-- Inline func supports only normal
vim.keymap.set({ "n", "x" }, "<leader>ri", function()
	require("refactoring").refactor("Refactor: Inline Variable")
end)
-- Inline var supports both normal and visual mode

vim.keymap.set("n", "<leader>rb", function()
	require("refactoring").refactor("Extract Block")
end, { desc = "Refactor: Extract Block" })

vim.keymap.set("n", "<leader>rbf", function()
	require("refactoring").refactor("Extract Block To File")
end, { desc = "Extract Block To File" })
-- Extract block supports only normal mode
require("telescope").load_extension("refactoring")

vim.keymap.set({ "n", "x" }, "<leader>fr", function()
	require("telescope").extensions.refactoring.refactors()
end)

-- prompt for a refactor to apply when the remap is triggered
vim.keymap.set({ "n", "x" }, "<leader>rr", function()
	require("refactoring").select_refactor()
end)
-- Note that not all refactor support both normal and visual mode
