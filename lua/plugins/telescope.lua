return {
	{
		"nvim-telescope/telescope.nvim",
		lazy = true,
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
		},
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<C-p>", builtin.find_files, {})
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
		end,
		opts = {
			defaults = {
				layout_config = {
					vertical = {
						width = 0.75,
					},
				},
				path_display = {
					filename_first = {
						reverse_directories = true,
					},
				},
			},
		},
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			local opts = {
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			}
			require("telescope").setup(opts)
			require("telescope").load_extension("ui-select")
		end,
	},
}
