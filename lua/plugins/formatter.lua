return {
	"stevearc/conform.nvim",
	opts = function(_, opts)
		-- add filetype mapping
		opts.formatters_by_ft.vhdl = { "vsg" }

		-- -- define the formatter if it's not builtin
		opts.formatters.vsg = {
			vsg = {
				prepend_args = { "--fix" },
			},
		}
	end,
}
