local capabilities = require("cmp_nvim_lsp").default_capabilities()
local root_pattern = require("lspconfig/util").root_pattern
local find_git_ancestor = require("lspconfig/util").find_git_ancestor

require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
        "intelephense",
        "psalm",
        "html",
        "yamlls",
        "cssls",
        "tsserver",
        "jsonls",
        "bashls",
        "angularls",
        "sqlls",
    },
})

local lspconfig = require("lspconfig")

local css_capabilities = vim.lsp.protocol.make_client_capabilities()
css_capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.cobol_ls.setup({
    cmd = { "cobol-language-support" },
    filetypes = { "cobol" },
    root_dir = find_git_ancestor,
})

lspconfig.cssls.setup({
    capabilities = css_capabilities,
    cmd = { "vscode-css-language-server", "--stdio" },
    filetypes = { "css", "scss", "less" },
    root_dir = root_pattern("package.json", ".git"),
    settings = {
        css = {
            validate = true,
        },
        less = {
            validate = true,
        },
        scss = {
            validate = true,
        },
    },
    single_file_support = true,
})

lspconfig.stimulus_ls.setup({
    capabilities = capabilities,
    cmd = { "stimulus-language-server", "--stdio" },
    filetypes = { "html", "ruby", "eruby", "blade", "php" },
})

lspconfig.lua_ls.setup({
    capabilities = capabilities,
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_dir = root_pattern(
        ".luarc.json",
        ".luarc.jsonc",
        ".luacheckrc",
        ".stylua.toml",
        "stylua.toml",
        "selene.toml",
        "selene.yml",
        ".git",
        "init.lua"
    ),
})

lspconfig.yamlls.setup({
    capabilities = capabilities,
    cmd = { "yaml-language-server", "--stdio" },
    filetypes = { "yaml", "yaml.docker-compose" },
    root_dir = find_git_ancestor,
    sigle_file_support = true,
    settings = {
        redhat = {
            telemetry = {
                enabled = false,
            },
        },
    },
})

lspconfig.bashls.setup({
    capabilities = capabilities,
    cmd = { "bash-language-server", "start" },
    filetypes = { "sh", "zsh", "bash" },
    root_dir = root_pattern(".git", ".bashrc", ".zshrc", ".bash_profile", ".zprofile"),
    sigle_file_support = true,
    settings = {
        bash = {
            filetypes = {
                "sh",
                "zsh",
                "bash",
            },
        },
    },
})

lspconfig.tsserver.setup({
    capabilities = capabilities,
    sigle_file_support = true,
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
    },
    root_dir = root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
    init_options = require("nvim-lsp-ts-utils").init_options,
    --
    on_attach = function(client, bufnr)
        local ts_utils = require("nvim-lsp-ts-utils")

        -- defaults
        ts_utils.setup({
            debug = false,
            disable_commands = false,
            enable_import_on_completion = true,

            -- import all
            import_all_timeout = 5000, -- ms
            -- lower numbers = higher priority
            import_all_priorities = {
                same_file = 1, -- add to existing import statement
                local_files = 2, -- git files or files with relative path markers
                buffer_content = 3, -- loaded buffer content
                buffers = 4, -- loaded buffer names
            },
            import_all_scan_buffers = 100,
            import_all_select_source = false,
            -- if false will avoid organizing imports
            always_organize_imports = true,

            -- filter diagnostics
            filter_out_diagnostics_by_severity = {},
            filter_out_diagnostics_by_code = {},

            -- inlay hints
            auto_inlay_hints = true,
            inlay_hints_highlight = "Comment",
            inlay_hints_priority = 200, -- priority of the hint extmarks
            inlay_hints_throttle = 150, -- throttle the inlay hint request
            inlay_hints_format = { -- format options for individual hint kind
                Type = {},
                Parameter = {},
                Enum = {},
                -- Example format customization for `Type` kind:
                -- Type = {
                --     highlight = "Comment",
                --     text = function(text)
                --         return "->" .. text:sub(2)
                --     end,
                -- },
            },

            -- update imports on file move
            update_imports_on_move = true,
            require_confirmation_on_move = false,
            watch_dir = nil,
        })

        -- required to fix code action ranges and filter diagnostics
        ts_utils.setup_client(client)
    end,
})

local project_library_path = "/path/to/project/lib"
local cmd =
{ "ngserver", "--stdio", "--tsProbeLocations", project_library_path, "--ngProbeLocations", project_library_path }

lspconfig.angularls.setup({
    capabilities = capabilities,
    cmd = cmd,
    on_new_config = function(new_config, new_root_dir)
        new_config.cmd = cmd
    end,
    root_dir = root_pattern("angular.json"),
})

vim.keymap.set("n", "<leader>o", vim.diagnostic.open_float)
vim.keymap.set("n", "gtp", vim.diagnostic.goto_prev, { desc = "Next diagnostic" })
vim.keymap.set("n", "gtn", vim.diagnostic.goto_next, { desc = "Previous diagnostic" })
vim.keymap.set("n", "<space>lo", vim.diagnostic.setloclist, { desc = "Loclist" })

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set("n", "gl", vim.lsp.buf.declaration, { desc = "Go to declaration" }, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" }, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover" }, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" }, opts)
        vim.keymap.set("n", "<leader>Ws", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("n", "<space>Wa", vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set("n", "<space>Wr", vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set("n", "<space>Wl", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set("n", "gty", vim.lsp.buf.type_definition, { desc = "Go to Type Definition" }, opts)
        vim.keymap.set("n", "crn", vim.lsp.buf.rename, { desc = "Rename" }, opts)
        vim.keymap.set({ "n", "v" }, "cx", vim.lsp.buf.code_action, { desc = "Code action" }, opts)
        vim.keymap.set("n", "gre", vim.lsp.buf.references, { desc = "References" }, opts)
        vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, { desc = "Format" }, opts)
    end,
})

local has_words_before = function()
    if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
        return false
    end
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
end

lspconfig.intelephense.setup({
    capabilities = capabilities,
    cmd = { "intelephense", "--stdio" },
    root_dir = root_pattern({ ".git", "composer.json" }),
    filetypes = { "php" },
    init_options = {
        licenceKey = "/home/fhruun/intelephense/licence.txt",
    },
    settings = {
        intelephense = {
            files = {
                maxSize = 1000000,
            },
        },
    },
})

-- luasnip setup
local luasnip = require("luasnip")

-- nvim-cmp setup
local cmp = require("cmp")
cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    formatting = {
        format = require("lspkind").cmp_format({
            mode = "symbol",
            max_width = 50,
            symbol_map = { Copilot = "" },
            ellipsis_car = "...",

            before = function(entry, vim_item)
                return vim_item
            end,
        }),
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-u>"] = cmp.mapping.scroll_docs(-4), -- Up
        ["<C-d>"] = cmp.mapping.scroll_docs(4), -- Down
        -- C-b (back) C-f (forward) for snippet placeholder navigation.
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() and has_words_before() then
                cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() and has_words_before() then
                cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    }),
    sorting = {
        priority_weight = 2,
        comparators = {
            require("copilot_cmp.comparators").pritoritize,
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            cmp.config.compare.recently_used,
            cmp.config.compare.locality,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
        },
    },
    sources = {
        { name = "copilot", group_index = 2 },
        { name = "path" },
        { name = "nvim_lsp" },
        { name = "buffer",  group_index = 3 },
        { name = "luasnip", group_index = 2 },
    },
})
