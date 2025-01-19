return {
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
			require("mason-lspconfig").setup({
				ensure_installed = {
					"bashls",
					"cssls",
					"csharp_ls",
					"dockerls",
					"docker_compose_language_service",
					"gopls",
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
					"pyright",
				},
			})
			require("mason-tool-installer").setup({
				ensure_installed = {
					"go-debug-adapter",
					"revive",
					"goimports",
					"mypy",
					"black",
					"debugpy",
					"isort",
					"ruff",
					"ruff-lsp",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			{ "j-hui/fidget.nvim", opts = {} },
			"saghen/blink.cmp",
		},
		event = "VeryLazy",
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("blink.cmp").get_lsp_capabilities({
				textDocument = { completion = { completionItem = { snippetSupport = true } } },
			})
			require("mason-lspconfig").setup_handlers({
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = capabilities,
					})
				end,
			})
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				settings = {
					Lua = {
						runtime = {
							-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
							version = "LuaJIT",
						},
						diagnostics = {
							-- Get the language server to recognize the `vim` global
							globals = { "vim" },
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
			lspconfig.ruff.setup({
				cmd_env = { RUFF_TRACE = "messages" },
				init_options = {
					settings = {
						logLevel = "error",
					},
				},
				keys = {
					{
						"<leader>co",
						LazyVim.lsp.action["source.organizeImports"],
						desc = "Organize Imports",
					},
				},
			})
			-- lspconfig.ruff_lsp.setup({
			-- 	keys = {
			-- 		{
			-- 			"<leader>co",
			-- 			LazyVim.lsp.action["source.organizeImports"],
			-- 			desc = "Organize Imports",
			-- 		},
			-- 	},
			-- })
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
		end,
	},
}
