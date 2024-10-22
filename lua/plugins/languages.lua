return {
  {
    "posva/vim-vue"
  },
  {
    "nvim-java/nvim-java",
  },
  {
    "nvim-java/nvim-java",
  },
  {
    "windwp/nvim-ts-autotag",
    opts = {},
  },
  {
    "folke/lazydev.nvim",
    dependencies = {
      { "Bilal2453/luvit-meta", lazy = true },
      { "folke/neodev.nvim",    enabled = false },
    },
    ft = "lua",
    cmd = "LazyDev",
    opts = {
      library = {
        { path = "luvit-meta/library", words = { "vim%.uv" } },
        { path = "LazyVim",            words = { "LazyVim" } },
        { path = "lazy.nvim",          words = { "LazyVim" } },
      },
    },
  },
  {
    "nvim-neotest/neotest-python",
  }
}
