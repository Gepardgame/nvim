local lazypath = vim.fn.stdpath("data") .. "/lazy/LazyVim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
-- _G.LazyVim = require("lazyvim.util")

require("config.options")
require("config.keymaps")
require("config.autocmds")
require("lazy").setup("plugins", {
  change_detection = {
    enabled = true,
    notify = false,
  }
}
)
