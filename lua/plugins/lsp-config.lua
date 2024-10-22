return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    }
                },
                ensure_installed = {
                    -- Python
                    "ruff",
                    "mypy",
                    "black",
                    "debugpy",
                },
            })
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
        },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "bashls",
                    "dockerls",
                    "docker_compose_language_service",
                    "jsonls",
                    "jdtls",
                    "lua_ls",
                    "markdown_oxide",
                    "nil_ls",
                    "sqlls",
                    "tflint",
                    "gitlab_ci_ls",
                    "yamlls",
                    "ansiblels",
                    "volar",
                    "slint_lsp",
                    -- Python
                    "pylsp",
                }
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            lspconfig.bashls.setup({ capabilities = capabilities })
            lspconfig.dockerls.setup({ capabilities = capabilities })
            lspconfig.docker_compose_language_service.setup({ capabilities = capabilities })
            lspconfig.jsonls.setup({ capabilities = capabilities })
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                settings = {
                    Lua = {
                        runtime = {
                            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                            version = 'LuaJIT',
                        },
                        diagnostics = {
                            -- Get the language server to recognize the `vim` global
                            globals = { 'vim' },
                        },
                        workspace = {
                            -- Make the server aware of Neovim runtime files
                            library = vim.api.nvim_get_runtime_file("", true),
                        },
                        telemetry = {
                            enable = false,
                        },
                    },
                },

            })
            lspconfig.markdown_oxide.setup({ capabilities = capabilities })
            lspconfig.nil_ls.setup({ capabilities = capabilities })
            lspconfig.sqlls.setup({ capabilities = capabilities })
            lspconfig.tflint.setup({ capabilities = capabilities })
            lspconfig.gitlab_ci_ls.setup({ capabilities = capabilities })
            lspconfig.yamlls.setup({ capabilities = capabilities })
            lspconfig.ansiblels.setup({ capabilities = capabilities })
            lspconfig.volar.setup({ capabilities = capabilities })
            lspconfig.jdtls.setup({ capabilities = capabilities })
            lspconfig.rust_analyzer.setup({
                capabilities = capabilities,
                settings = {
                    ["rust-analyzer"] = {
                        cargo = {
                            features = "all",
                        },
                        procMacro = {
                            enable = true,
                        },
                    },
                },
            })
            lspconfig.slint_lsp.setup({
                cmd = { "slint-lsp" },
                filetypes = { "slint" },
                root_dir = lspconfig.util.root_pattern("slint.toml", ".git"),
                settings = {},
            })
            lspconfig.pylsp.setup({
                capabilities = capabilities,
                filetypes = { "python" },
                settings = {
                    pylsp = {
                        plugins = {}
                    }
                }
            })

            vim.keymap.set("n", "<A-CR>", vim.lsp.buf.hover, { desc = "Gives Hover Information" })
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Goes to Defention" })
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Gives Code Actions" })
            vim.keymap.set('n', 'gr', '<Cmd>Telescope lsp_references<CR>', { desc = "Find references" })
            vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { desc = "Rename variabale" })
        end,
    },
}
