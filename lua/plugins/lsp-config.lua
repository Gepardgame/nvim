return {
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim"
    },
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        },
      })
      require("mason-lspconfig").setup({
        ensure_installed = {
          "bashls",
          "dockerls",
          "docker_compose_language_service",
          "jsonls",
          "jdtls",
          "lua_ls",
          "markdown_oxide",
          "nil_ls",
          "sqlls",
          "tflint",
          "gitlab_ci_ls",
          "yamlls",
          "ansiblels",
          "volar",
          "slint_lsp",
          "pyright",
        }
      })
      require("mason-tool-installer").setup({
        ensure_installed = {
          "mypy",
          "black",
          "debugpy",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      { 'j-hui/fidget.nvim', opts = {} },
      { 'folke/neodev.nvim', opts = {} },
    },
    event = 'VeryLazy',
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lsp_attach = function(client, bufnr)
        -- Create your keybindings here...
      end
      require('mason-lspconfig').setup_handlers({
        function(server_name)
          lspconfig[server_name].setup({
            on_attach = lsp_attach,
            capabilities = capabilities,
          })
        end
      })
      lspconfig.bashls.setup({ capabilities = capabilities })
      lspconfig.dockerls.setup({ capabilities = capabilities })
      lspconfig.docker_compose_language_service.setup({ capabilities = capabilities })
      lspconfig.jsonls.setup({ capabilities = capabilities })
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime = {
              -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
              version = 'LuaJIT',
            },
            diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = { 'vim' },
            },
            workspace = {
              -- Make the server aware of Neovim runtime files
              library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
              enable = false,
            },
          },
        },

      })
      lspconfig.markdown_oxide.setup({ capabilities = capabilities })
      lspconfig.nil_ls.setup({ capabilities = capabilities })
      lspconfig.sqlls.setup({ capabilities = capabilities })
      lspconfig.tflint.setup({ capabilities = capabilities })
      lspconfig.gitlab_ci_ls.setup({ capabilities = capabilities })
      lspconfig.yamlls.setup({ capabilities = capabilities })
      lspconfig.ansiblels.setup({ capabilities = capabilities })
      lspconfig.volar.setup({ capabilities = capabilities })
      lspconfig.jdtls.setup({ capabilities = capabilities })
      lspconfig.rust_analyzer.setup({
        capabilities = capabilities,
        settings = {
          ["rust-analyzer"] = {
            cargo = {
              features = "all",
            },
            procMacro = {
              enable = true,
            },
          },
        },
      })
      lspconfig.slint_lsp.setup({
        cmd = { "slint-lsp" },
        filetypes = { "slint" },
        root_dir = lspconfig.util.root_pattern("slint.toml", ".git"),
        settings = {},
      })
      lspconfig.pyright.setup({
        capabilities = capabilities,
        filetypes = { "python" },
        settings = {
          pyright = {
            plugins = {}
          }
        }
      })

      local open_floating_preview = vim.lsp.util.open_floating_preview
      function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
        opts = opts or {}
        opts.border = opts.border or "rounded" -- Set border to rounded
        return open_floating_preview(contents, syntax, opts, ...)
      end

      vim.keymap.set("n", "<A-CR>", vim.lsp.buf.hover, { desc = "Gives Hover Information" })
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Goes to Defention" })
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Gives Code Actions" })
      vim.keymap.set('n', 'gr', '<Cmd>Telescope lsp_references<CR>', { desc = "Find references" })
      vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { desc = "Rename variabale" })
    end,
  },
}
