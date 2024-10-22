return {
	"nvimtools/none-ls.nvim",
	requires = { "nvim-lua/plenary.nvim" },
	opts = function()
		local none_ls = require("null-ls")
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		local opts = {
			sources = {
				none_ls.builtins.diagnostics.mypy,
				none_ls.builtins.formatting.black,
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

		vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, {})
	end,
}
