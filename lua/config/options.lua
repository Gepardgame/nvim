local opt = vim.opt

opt.wrap = true
opt.ignorecase = true
opt.smartcase = true
opt.termguicolors = true

opt.expandtab = true
opt.autoindent = true
opt.tabstop = 2
vim.bo.softtabstop = 2
opt.shiftwidth = 4

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.autoformat = true

opt.backspace = "indent,eol,start"

opt.foldexpr = "nvim_treesitter#foldexpr()"

opt.clipboard:append("unnamedplus")
vim.conceallevel = 2
vim.confirm = true
vim.cursorline = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.ttimeoutlen = 100
vim.filetype.add({
	extension = {
		slint = "slint",
	},
})
