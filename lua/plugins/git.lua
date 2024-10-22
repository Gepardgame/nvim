return {
	{
		"f-person/git-blame.nvim",
		event = "VeryLazy",
		config = function()
			vim.keymap.set("n", "<leader>gb", "<cmd>GitBlameToggle<cr>", { desc = "Toggles git blame line in lualine" })
			vim.g.gitblame_display_virtual_text = 0
		end,
	},
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",

			"nvim-telescope/telescope.nvim",
		},
		config = function()
			require("neogit").setup({})
		end,
	},
}
