return {
  {
    "f-person/git-blame.nvim",
    config = function()
      vim.keymap.set("n", "<leader>gb", "<cmd>GitBlameToggle<cr>", { desc = "Toggles git blame line in lualine" })
      vim.g.gitblame_display_virtual_text = 0
    end,
  },
  {
    "NeogitOrg/neogit",
    tag = "v0.0.1",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",

      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("neogit").setup({})
      vim.keymap.set("n", "<leader>gg", "<cmd>Neogit<cr>", { desc = "Opens git window" })
    end,
  },
}
