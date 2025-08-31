return {
	"nvim-treesitter/nvim-treesitter",
	opts = { ensure_installed = { "ninja", "rst", "go", "python", "c", "cpp" } },

	init = function()
		vim.filetype.add({
			pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
		})
	end,
}
