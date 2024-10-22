local keymap = vim.keymap
keymap.set("n", "ZZ", "<cmd>qa<cr>", { desc = "Quits hole program" })
keymap.set("n", "<leader>h", "<cmd>nohlsearch<cr>", { desc = "Clear search Highlighting" })
keymap.set("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })
keymap.set({ "n", "v", "i" }, "<C-s>", function()
  vim.cmd("w")
  vim.lsp.buf.format()
  vim.cmd("w")
  vim.api.nvim_command("stopinsert")
end, { desc = "Save File" })
keymap.set({ "n", "v", "i" }, "<C-m-s>", function()
  vim.cmd("wa")
  vim.lsp.buf.format()
  vim.cmd("wa")
  vim.api.nvim_command("stopinsert")
end, { desc = "Save all Files" })


-- Git
vim.keymap.set("n", "<leader>gg", "<cmd>Neogit<cr>", { desc = "Opens git window" })
