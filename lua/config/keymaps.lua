local keymap = vim.keymap
keymap.set("n", "ZZ", "<cmd>qa<cr>", { desc = "Quit all" })
keymap.set("n", "<leader>h", "<cmd>nohlsearch<cr>", { desc = "Clear search Highlighting" })
keymap.set("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })
keymap.set({ "n", "v", "i" }, "<C-s>", function()
	vim.cmd("w")
	vim.api.nvim_command("stopinsert")
end, { desc = "Save File" })
keymap.set({ "n", "v", "i" }, "<C-m-s>", function()
	vim.cmd("wa")
	vim.api.nvim_command("stopinsert")
end, { desc = "Save all Files" })

-- Git
keymap.set("n", "<leader>gg", "<cmd>Neogit<cr>", { desc = "Opens git window" })
keymap.set("n", "<leader>gb", "<cmd>GitBlameToggle<cr>", { desc = "Toggles git blame line in lualine" })
keymap.set("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>", { desc = "Shows hunk of line in popup" })

-- LSP
keymap.set("n", "<A-CR>", vim.lsp.buf.hover, { desc = "Gives Hover Information" })
keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Goes to Defention" })
keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Goes to implementation" })
keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Gives Code Actions" })
keymap.set("n", "gr", "<Cmd>FzfLua lsp_references<CR>", { desc = "Find references" })
keymap.set("n", "<leader>r", vim.lsp.buf.rename, { desc = "Rename variabale" })
keymap.set("n", "<leader>m", "<Cmd>Mason<cr>", { desc = "Open Mason" })
