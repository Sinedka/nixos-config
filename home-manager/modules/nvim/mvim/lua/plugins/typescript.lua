return {
  {
    "pmizio/typescript-tools.nvim",
    ft = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "saghen/blink.cmp",
    },
    opts = function()
      local capabilities = require("config.lsp.capabilities")
      local ts = require("config.lsp.servers.tsserver")

      return {
        capabilities = capabilities,
        handlers = ts.handlers,
        on_attach = ts.on_attach,
        settings = ts.settings,
      }
    end,
  },
}
