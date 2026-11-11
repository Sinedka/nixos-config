return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },

    dependencies = {
      "pmizio/typescript-tools.nvim",
      "nvim-lua/plenary.nvim",
      "saghen/blink.cmp",
    },

    config = function()
      local capabilities = require("config.lsp.capabilities")
      local handlers = require("config.lsp.handlers")
      local on_attach = require("config.lsp.on_attach")

      local function configure(server, opts)
        opts = opts or {}
        opts.capabilities = opts.capabilities or capabilities
        opts.handlers = opts.handlers or handlers
        opts.on_attach = opts.on_attach or on_attach

        vim.lsp.config(server, opts)
      end

      -- =========================
      -- Bash
      -- =========================
      configure("bashls")

      configure("clangd", {
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
        },

        filetypes = { "c", "cpp", "objc", "objcpp" },
      })

      -- =========================
      -- CSS / SCSS / Less
      -- =========================
      configure("cssls")

      -- =========================
      -- HTML
      -- =========================
      configure("html")

      -- =========================
      -- Java
      -- =========================
      configure("jdtls")

      -- =========================
      -- JSON
      -- =========================
      configure("jsonls")

      -- =========================
      -- Lua
      -- =========================
      configure("lua_ls")

      -- =========================
      -- Markdown
      -- =========================
      configure("marksman")

      -- =========================
      -- Python
      -- =========================
      configure("pyright")

      -- =========================
      -- TOML
      -- =========================
      configure("taplo")

      -- =========================
      -- YAML
      -- =========================
      configure("yamlls")


      -- =========================
      -- Enable LSP servers
      -- =========================
      vim.lsp.enable({
        "bashls",
        "clangd",
        "cssls",
        "html",
        "jdtls",
        "jsonls",
        "kotlin_language_server",
        "lua_ls",
        "marksman",
        "pyright",
        "taplo",
        "yamlls",
      })
    end,
  },
}
