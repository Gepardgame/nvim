return {
	"nvimtools/none-ls.nvim",
	requires = { "nvim-lua/plenary.nvim" },
	event = "LazyFile",
	init = function()
		LazyVim.on_very_lazy(function()
			-- register the formatter with LazyVim
			LazyVim.format.register({
				name = "none-ls.nvim",
				priority = 200, -- set higher than conform, the builtin formatter
				primary = true,
				format = function(buf)
					return LazyVim.lsp.format({
						bufnr = buf,
						filter = function(client)
							return client.name == "null-ls"
						end,
					})
				end,
				sources = function(buf)
					local ret = require("null-ls.sources").get_available(vim.bo[buf].filetype, "NULL_LS_FORMATTING")
						or {}
					return vim.tbl_map(function(source)
						return source.name
					end, ret)
				end,
			})
		end)
	end,
	opts = function()
		-- helper to resolve pyenv path
		local get_pyenv_python_path = function()
			local handle = io.popen("pyenv which python")
			if handle == nil then
				return nil
			end
			local result = handle:read("*a")
			handle:close()
			return result and result:gsub("%s+$", "") or nil
		end
		local none_ls = require("null-ls")
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		local opts = {
			sources = {
				none_ls.builtins.diagnostics.fish,

				none_ls.builtins.formatting.fish_indent,
				none_ls.builtins.formatting.stylua,
				none_ls.builtins.formatting.shfmt,
				none_ls.builtins.formatting.isort,
				none_ls.builtins.formatting.goimports,

				none_ls.builtins.diagnostics.mypy.with({
					extra_args = function()
						local virtual = get_pyenv_python_path()
						return { "--python-executable", virtual }
					end,
				}),
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
		return opts
	end,

	config = function(_, opts)
		local null_ls = require("null-ls")
		null_ls.setup(opts)
		opts.root_dir = opts.root_dir
			or require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git")

		vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, {})
	end,
}
