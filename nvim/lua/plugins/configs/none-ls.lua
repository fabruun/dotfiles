local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local opts = {
    sources = {
        -- Code Actions
        null_ls.builtins.code_actions.gitsigns.with({
            config = {
                filter_actions = function(title)
                    return title:lower():match("blame") == nil
                end,
            },
        }),
        null_ls.builtins.code_actions.impl,
        null_ls.builtins.code_actions.refactoring,
        null_ls.builtins.code_actions.shellcheck,

        -- Formatting
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.fixjson,
        null_ls.builtins.formatting.biome,
        null_ls.builtins.formatting.ocdc,
        null_ls.builtins.formatting.yamlfmt,
        null_ls.builtins.formatting.sqlfluff.with({
            extra_args = { "--dialect", "mysql" },
        }),
        null_ls.builtins.formatting.tidy,

        -- Diagnostics
        null_ls.builtins.diagnostics.codespell,
        null_ls.builtins.diagnostics.jsonlint,
        null_ls.builtins.diagnostics.stylelint,
        null_ls.builtins.diagnostics.tidy,
        null_ls.builtins.diagnostics.todo_comments,
        null_ls.builtins.diagnostics.trail_space,
        null_ls.builtins.diagnostics.hadolint,
        null_ls.builtins.diagnostics.checkstyle.with({
            extra_args = { "-c", "/google_checks.xml" },
        }),
        null_ls.builtins.diagnostics.zsh,
        null_ls.builtins.diagnostics.yamllint,
        null_ls.builtins.diagnostics.sqlfluff.with({
            extra_args = { "--dialect", "mysql" },
        }),

        -- Completion
        null_ls.builtins.completion.luasnip,
        null_ls.builtins.completion.spell,
        null_ls.builtins.completion.tags,

        -- Hover
        null_ls.builtins.hover.dictionary,
        null_ls.builtins.hover.printenv,
    },
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({
                group = augroup,
                buffer = bufnr,
            })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ bufnr = bufnr })
                end,
            })
        end
    end,
}

null_ls.setup(opts)
