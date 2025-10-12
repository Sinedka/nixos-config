return {
  "Exafunction/windsurf.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
  },
  config = function()
    require("codeium").setup({
      {
        manager_path = nil,
        bin_path = vim.fn.stdpath("cache") .. "/codeium/bin",
        config_path = vim.fn.stdpath("cache") .. "/codeium/config.json",
        language_server_download_url = "https://github.com",
        api = {
          host = "server.codeium.com",
          port = "443",
          path = "/",
          portal_url = "codeium.com",
        },
        quiet = false,
        enterprise_mode = nil,
        detect_proxy = nil,
        tools = {},
        wrapper = nil,
        enable_chat = true,
        enable_local_search = true,
        enable_index_service = true,
        search_max_workspace_file_count = 5000,
        file_watch_max_dir_count = 50000,
        enable_cmp_source = true,
        virtual_text = {
          enabled = true,
          filetypes = {},
          default_filetype_enabled = true,
          manual = false,
          idle_delay = 75,
          virtual_text_priority = 65535,
          map_keys = true,
          accept_fallback = nil,
          key_bindings = {
            accept = "<c-l>",
            accept_word = false,
            accept_line = false,
            clear = false,
            next = "<M-]>",
            prev = "<M-[>",
          },
        },
        workspace_root = {
          use_lsp = true,
          find_root = nil,
          paths = {
            ".bzr",
            ".git",
            ".hg",
            ".svn",
            "_FOSSIL_",
            "package.json",
          },
        },
      }
    })
  end
}
