return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "bashls",
          "dockerls",
          "docker_compose_language_service",
          "jsonls",
          "java_language_server",
          "lua_ls",
          "markdown_oxide",
          "nil_ls",
          "ruff_lsp",
          "jedi_language_server",
          "sqlls",
          "tflint",
          "gitlab_ci_ls",
          "yamlls",
          "ansiblels",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      lspconfig.bashls.setup({ capabilities = capabilities })
      lspconfig.dockerls.setup({ capabilities = capabilities })
      lspconfig.docker_compose_language_service.setup({ capabilities = capabilities })
      lspconfig.jsonls.setup({ capabilities = capabilities })
      lspconfig.java_language_server.setup({ capabilities = capabilities })
      lspconfig.lua_ls.setup({ capabilities = capabilities })
      lspconfig.markdown_oxide.setup({ capabilities = capabilities })
      lspconfig.nil_ls.setup({ capabilities = capabilities })
      lspconfig.ruff_lsp.setup({ capabilities = capabilities })
      lspconfig.jedi_language_server.setup({ capabilities = capabilities })
      lspconfig.sqlls.setup({ capabilities = capabilities })
      lspconfig.tflint.setup({ capabilities = capabilities })
      lspconfig.gitlab_ci_ls.setup({ capabilities = capabilities })
      lspconfig.yamlls.setup({ capabilities = capabilities })
      lspconfig.ansiblels.setup({ capabilities = capabilities })

      vim.keymap.set("n", "<A-CR>", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
