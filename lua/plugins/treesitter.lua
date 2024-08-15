return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
		ensure_installed = {
			"lua",
			"python",
			"java",
			"bash",
			"dart",
			"dockerfile",
			"json",
			"nix",
			"sql",
			"tmux",
			"yaml",
			"rust",
		},
		auto_install = true,
		highlight = { enable = true },
		indent = { enable = true },
	},
}
