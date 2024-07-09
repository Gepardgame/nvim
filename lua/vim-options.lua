vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.o.clipboard = "unnamedplus"
vim.o.number = true
vim.o.relativenumber = true
vim.o.ttimeoutlen = 100

vim.keymap.set({ "n", "v", "i" }, "<C-s>", function()
	vim.cmd("w")
	vim.lsp.buf.format()
	vim.cmd("w")
end, {})
vim.keymap.set({ "n", "v", "i" }, "<C-S>", function()
	vim.cmd("wa")
	vim.lsp.buf.format()
	vim.cmd("wa")
end, {})
