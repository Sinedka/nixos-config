return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",

    config = function()
      local treesitter = require("nvim-treesitter")

      treesitter.setup()

      local parsers = {
        "bash",
        "c",
        "cpp",
        "cmake",
        "comment",
        "css",
        "diff",
        "dockerfile",
        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "html",
        "javascript",
        "json",
        "lua",
        "luadoc",
        "luap",
        "make",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "rust",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
        -- "ft_to_lang",
      }

      treesitter.install(parsers)

      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "bash",
          "c",
          "cpp",
          "cmake",
          "css",
          "html",
          "javascript",
          "json",
          "jsonc",
          "lua",
          "markdown",
          "python",
          "rust",
          "toml",
          "typescript",
          "typescriptreact",
          "vim",
          "yaml",
        },
        callback = function(args)
          vim.treesitter.start(args.buf)
        end,
      })
    end,
  },
}
