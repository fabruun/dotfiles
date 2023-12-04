local du = require("dapui")

du.setup()

vim.keymap.set("n", "<leader>dap", function()
	du.toggle()
end)
