return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"linrongbin16/lsp-progress.nvim",
	},
	opts = {
		options = {
			theme = "codedark",
			icons_enabled = true,
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			disabled_filetypes = {
				statusline = {},
				winbar = {},
			},
			ignore_focus = {},
			always_divide_middle = true,
			globalstatus = true,
			refresh = {
				statusline = 1000,
				tabline = 1000,
				winbar = 1000,
			},
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = {
				"branch",
				"diff",
				"diagnostics",
				{
					require("gitblame").get_current_blame_text,
					cond = require("gitblame").is_blame_text_available,
				},
			},
			lualine_c = {
				{
					"filename",
					file_status = true,
					newfile_status = false,
					path = 0,
					symbols = {
						modified = "[+]",
						readonly = "[-]",
					},
				},
			},
			lualine_x = { "searchcount", "encoding", "fileformat", "filetype", "filesize" },
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
		tabline = {},
		winbar = {},
		inactive_winbar = {},
		extensions = {},
	},
}
