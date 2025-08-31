return {
<<<<<<< HEAD
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"williamboman/mason.nvim",
		"williamboman/mason.nvim",

		"WhoIsSethDaniel/mason-tool-installer.nvim",
		{ "j-hui/fidget.nvim", opts = {} },
		"saghen/blink.cmp",
=======
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
					"arduino_language_server",
					"clangd",
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
					-- "pyright",
					"hyprls",
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
					-- "ruff-lsp",
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
			local on_attach = function(client, bufnr)
				local nmap = function(keys, func, desc)
					if desc then
						desc = "LSP: " .. desc
					end

					vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
				end
			end

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
			require("lspconfig").jedi_language_server.setup({
				capabilities = capabilities,
				on_attach = on_attach,
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
			lspconfig.clangd.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				cmd = {
					"clangd",
					"--background-index",
					"-j=12",
					"--query-driver=**",
					"--clang-tidy",
					"--all-scopes-completion",
					"--cross-file-rename",
					"--completion-style=detailed",
					"--header-insertion-decorators",
					"--header-insertion=iwyu",
					"--pch-storage=memory",
					"--suggest-missing-includes",
				},
			})
		end,
>>>>>>> e54e4bf (add something)
	},
	event = "VeryLazy",
	config = function()
		local mason = require("mason")
		local lspconfig = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")
		local capabilities = {
			textDocument = {
				semanticTokens = {
					multilineTokenSupport = true,
				},
			},
		}
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})
		mason_lspconfig.setup({
			ensure_installed = {
				"bashls",
				"cssls",
				"csharp_ls",
				"docker_compose_language_service",
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
		mason_tool_installer.setup({
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

		vim.lsp.config("*", {
			capabilities = capabilities,
		})
		vim.lsp.config("lua_ls", {
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
		vim.lsp.config("ruff", {
			capabilities = capabilities,
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
		vim.lsp.config("rust_analyzer", {
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
		vim.lsp.config("slint_lsp", {
			capabilities = capabilities,
			cmd = { "slint-lsp" },
			filetypes = { "slint" },
			root_dir = lspconfig.util.root_pattern("slint.toml", ".git"),
			settings = {},
		})
	end,
}
