vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.g.autoformat = true
vim.o.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"
vim.conceallevel = 2
vim.confirm = true
vim.cursorline = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.ttimeoutlen = 100
vim.keymap.set("n", "<leader>h", "<cmd>nohlsearch<cr>", { desc = "Clear search Highlighting" })
vim.keymap.set("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })
vim.keymap.set({ "n", "v", "i" }, "<C-s>", function()
  vim.cmd("w")
  vim.lsp.buf.format()
  vim.cmd("w")
  vim.api.nvim_command("stopinsert")
end, { desc = "Save File" })
vim.keymap.set({ "n", "v", "i" }, "<C-m-s>", function()
  vim.cmd("wa")
  vim.lsp.buf.format()
  vim.cmd("wa")
  vim.api.nvim_command("stopinsert")
end, { desc = "Save all Files" })
