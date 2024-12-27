return {
	{
		"f-person/git-blame.nvim",
		event = "VeryLazy",
		config = function()
			vim.g.gitblame_display_virtual_text = 0
		end,
	},
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
		},
		event = "VeryLazy",
		config = function()
			require("neogit").setup({})
		end,
	},
}
