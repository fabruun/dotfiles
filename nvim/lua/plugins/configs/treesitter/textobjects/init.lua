local select = require("plugins.configs.treesitter.textobjects.select")
local move = require("plugins.configs.treesitter.textobjects.move")
local swap = require("plugins.configs.treesitter.textobjects.swap")
local repeat_move = require("nvim-treesitter.textobjects.repeatable_move")

-- Repeat movement with ; and ,
-- ensure ; goes forward and , goes backward regardless of the last direction
vim.keymap.set({ "n", "x", "o" }, ";", repeat_move.repeat_last_move_next)
vim.keymap.set({ "n", "x", "o" }, ",", repeat_move.repeat_last_move_previous)

-- vim way: ; goes to the direction you were moving.
-- vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
-- vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

-- Optionally, make builtin f, F, t, T also repeatable with ; and ,
vim.keymap.set({ "n", "x", "o" }, "f", repeat_move.builtin_f)
vim.keymap.set({ "n", "x", "o" }, "F", repeat_move.builtin_F)
vim.keymap.set({ "n", "x", "o" }, "t", repeat_move.builtin_t)
vim.keymap.set({ "n", "x", "o" }, "T", repeat_move.builtin_T)

return {
    select,
    move,
    swap,
}
