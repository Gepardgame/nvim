local function augroup(name, params)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, params)
end

vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank", {}),
  desc = "Hightlight selection on yank",
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "java" },
  callback = function()
    vim.b.autoformat = false
  end,
})
