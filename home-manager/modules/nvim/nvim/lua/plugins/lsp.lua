return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      require("config.lsp.setup")
      require("config.lsp.config")
      require("config.lsp.functions")
    end,
  },

  {
    "antosha417/nvim-lsp-file-operations",
    event = "LspAttach",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-tree/nvim-tree.lua" },
    },
    config = function()
      require("lsp-file-operations").setup()
    end,
  },
}
